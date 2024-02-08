if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    """
    df=data[((data['passenger_count']>0) &  
             (data['trip_distance']>0))]

    print("Rows with zero passengers and zero trip distance" , len(df))
    df['lpep_pickup_date']=df['lpep_pickup_datetime'].dt.date
    print("Original columns:")
    print(df.columns)
    df.columns = (df.columns
                .str.replace('(?<=[a-z])(?=[A-Z])', '_', regex=True)
                .str.lower()
             )
    print("Renamed columns")
    print(df.columns)
    print(df["vendor_id"].unique().tolist())
    return df

   


@test
def test_output(output, *args):    
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
    print(output)
    #Assert passenger_count > 0
    assert output["passenger_count"].isin([0]).sum() == 0, 'Zero passangers error'
    
    #Assert trip_distance > 0
    assert output['trip_distance'].isin([0]).sum() == 0, 'Zero trip distance error'
    
    # Assert that all values in the "vendor_id" column are among the existing values
    assert output['vendor_id'].isin(output['vendor_id'].unique()).all(), 'Not all values in "vendor_id" are among the existing values'
