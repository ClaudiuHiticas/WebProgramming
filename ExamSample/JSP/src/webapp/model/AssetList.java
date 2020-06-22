package webapp.model;

import java.util.List;

public class AssetList {
    List<Asset> assets;

    public AssetList() {
    }

    public AssetList(List<Asset> assets) {
        this.assets = assets;
    }

    public List<Asset> getAssets() {
        return assets;
    }

    public void setAssets(List<Asset> assets) {
        this.assets = assets;
    }

    @Override
    public String toString() {
        return "AssetList{" +
                "assets=" + assets +
                '}';
    }
}
