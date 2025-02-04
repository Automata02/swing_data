import 'dart:convert';

Swing swingFromJson(String str) => Swing.fromJson(json.decode(str));

class Swing {
    String captureType;
    Parameters parameters;
    Quaternions quaternions;
    int sampleCount;
    TemporalModel temporalModel;
    int version;
    WristModel wristModel;

    Swing({
        required this.captureType,
        required this.parameters,
        required this.quaternions,
        required this.sampleCount,
        required this.temporalModel,
        required this.version,
        required this.wristModel,
    });

    factory Swing.fromJson(Map<String, dynamic> json) => Swing(
        captureType: json["captureType"],
        parameters: Parameters.fromJson(json["parameters"]),
        quaternions: Quaternions.fromJson(json["quaternions"]),
        sampleCount: json["sampleCount"],
        temporalModel: TemporalModel.fromJson(json["temporalModel"]),
        version: json["version"],
        wristModel: WristModel.fromJson(json["wristModel"]),
    );

    Map<String, dynamic> toJson() => {
        "captureType": captureType,
        "parameters": parameters.toJson(),
        "quaternions": quaternions.toJson(),
        "sampleCount": sampleCount,
        "temporalModel": temporalModel.toJson(),
        "version": version,
        "wristModel": wristModel.toJson(),
    };
}

class Parameters {
    Hfa hfaCrWrFlexEx;
    Hfa hfaCrWrRadUln;
    Hfa hfaGlfCapRot;
    GlfAtiCapPosAng glfAtiCapPosAng;
    GlfAtiCapPosInd glfAtiCapPosInd;
    GlfAtiCapTimes glfAtiCapTimes;
    GlfFsIndExt glfFsIndExt;
    GlfFsRotVals glfFsRotVals;
    GlfSuggPRange glfSuggTopRange;
    GlfSuggPRange glfSuggImpRange;

    Parameters({
        required this.hfaCrWrFlexEx,
        required this.hfaCrWrRadUln,
        required this.hfaGlfCapRot,
        required this.glfAtiCapPosAng,
        required this.glfAtiCapPosInd,
        required this.glfAtiCapTimes,
        required this.glfFsIndExt,
        required this.glfFsRotVals,
        required this.glfSuggTopRange,
        required this.glfSuggImpRange,
    });

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        hfaCrWrFlexEx: Hfa.fromJson(json["HFA_crWrFlexEx"]),
        hfaCrWrRadUln: Hfa.fromJson(json["HFA_crWrRadUln"]),
        hfaGlfCapRot: Hfa.fromJson(json["HFA_glfCapRot"]),
        glfAtiCapPosAng: GlfAtiCapPosAng.fromJson(json["glfATICapPosAng"]),
        glfAtiCapPosInd: GlfAtiCapPosInd.fromJson(json["glfATICapPosInd"]),
        glfAtiCapTimes: GlfAtiCapTimes.fromJson(json["glfATICapTimes"]),
        glfFsIndExt: GlfFsIndExt.fromJson(json["glfFsIndExt"]),
        glfFsRotVals: GlfFsRotVals.fromJson(json["glfFsRotVals"]),
        glfSuggTopRange: GlfSuggPRange.fromJson(json["glfSuggTopRange"]),
        glfSuggImpRange: GlfSuggPRange.fromJson(json["glfSuggImpRange"]),
    );

    Map<String, dynamic> toJson() => {
        "HFA_crWrFlexEx": hfaCrWrFlexEx.toJson(),
        "HFA_crWrRadUln": hfaCrWrRadUln.toJson(),
        "HFA_glfCapRot": hfaGlfCapRot.toJson(),
        "glfATICapPosAng": glfAtiCapPosAng.toJson(),
        "glfATICapPosInd": glfAtiCapPosInd.toJson(),
        "glfATICapTimes": glfAtiCapTimes.toJson(),
        "glfFsIndExt": glfFsIndExt.toJson(),
        "glfFsRotVals": glfFsRotVals.toJson(),
        "glfSuggTopRange": glfSuggTopRange.toJson(),
        "glfSuggImpRange": glfSuggImpRange.toJson(),
    };
}

class GlfAtiCapPosAng {
    double flexExtAddress;
    double flexExtImpact;
    double flexExtTop;
    double radUlnAddress;
    double radUlnImpact;
    double radUlnTop;

    GlfAtiCapPosAng({
        required this.flexExtAddress,
        required this.flexExtImpact,
        required this.flexExtTop,
        required this.radUlnAddress,
        required this.radUlnImpact,
        required this.radUlnTop,
    });

    factory GlfAtiCapPosAng.fromJson(Map<String, dynamic> json) => GlfAtiCapPosAng(
        flexExtAddress: json["flexExtAddress"]?.toDouble(),
        flexExtImpact: json["flexExtImpact"]?.toDouble(),
        flexExtTop: json["flexExtTop"]?.toDouble(),
        radUlnAddress: json["radUlnAddress"]?.toDouble(),
        radUlnImpact: json["radUlnImpact"]?.toDouble(),
        radUlnTop: json["radUlnTop"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "flexExtAddress": flexExtAddress,
        "flexExtImpact": flexExtImpact,
        "flexExtTop": flexExtTop,
        "radUlnAddress": radUlnAddress,
        "radUlnImpact": radUlnImpact,
        "radUlnTop": radUlnTop,
    };
}

class GlfAtiCapPosInd {
    int address;
    int impact;
    int top;

    GlfAtiCapPosInd({
        required this.address,
        required this.impact,
        required this.top,
    });

    factory GlfAtiCapPosInd.fromJson(Map<String, dynamic> json) => GlfAtiCapPosInd(
        address: json["address"],
        impact: json["impact"],
        top: json["top"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "impact": impact,
        "top": top,
    };
}

class GlfAtiCapTimes {
    double addressToTop;
    double backDownRatio;
    double impactToFtEnd;
    double topToImpact;

    GlfAtiCapTimes({
        required this.addressToTop,
        required this.backDownRatio,
        required this.impactToFtEnd,
        required this.topToImpact,
    });

    factory GlfAtiCapTimes.fromJson(Map<String, dynamic> json) => GlfAtiCapTimes(
        addressToTop: json["addressToTop"]?.toDouble(),
        backDownRatio: json["backDownRatio"]?.toDouble(),
        impactToFtEnd: json["impactToFtEnd"]?.toDouble(),
        topToImpact: json["topToImpact"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "addressToTop": addressToTop,
        "backDownRatio": backDownRatio,
        "impactToFtEnd": impactToFtEnd,
        "topToImpact": topToImpact,
    };
}

class GlfFsIndExt {
    int p5;
    int p6;
    int p8;
    int p9;

    GlfFsIndExt({
        required this.p5,
        required this.p6,
        required this.p8,
        required this.p9,
    });

    factory GlfFsIndExt.fromJson(Map<String, dynamic> json) => GlfFsIndExt(
        p5: json["p5"],
        p6: json["p6"],
        p8: json["p8"],
        p9: json["p9"],
    );

    Map<String, dynamic> toJson() => {
        "p5": p5,
        "p6": p6,
        "p8": p8,
        "p9": p9,
    };
}

class GlfFsRotVals {
    double deltaImpP6;
    double deltaP8Imp;
    double rateOfClosureAroundImp;

    GlfFsRotVals({
        required this.deltaImpP6,
        required this.deltaP8Imp,
        required this.rateOfClosureAroundImp,
    });

    factory GlfFsRotVals.fromJson(Map<String, dynamic> json) => GlfFsRotVals(
        deltaImpP6: json["deltaImpP6"]?.toDouble(),
        deltaP8Imp: json["deltaP8Imp"]?.toDouble(),
        rateOfClosureAroundImp: json["rateOfClosureAroundImp"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "deltaImpP6": deltaImpP6,
        "deltaP8Imp": deltaP8Imp,
        "rateOfClosureAroundImp": rateOfClosureAroundImp,
    };
}

class GlfSuggPRange {
    int min;
    int max;
    String patternKey;

    GlfSuggPRange({
        required this.min,
        required this.max,
        required this.patternKey,
    });

    factory GlfSuggPRange.fromJson(Map<String, dynamic> json) => GlfSuggPRange(
        min: json["min"],
        max: json["max"],
        patternKey: json["patternKey"],
    );

    Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "patternKey": patternKey,
    };
}

class Hfa {
    List<double> values;

    Hfa({
        required this.values,
    });

    factory Hfa.fromJson(Map<String, dynamic> json) => Hfa(
        values: List<double>.from(json["values"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x)),
    };
}

class Quaternions {
    List<List<double>> lowerArm;
    List<List<double>> palm;

    Quaternions({
        required this.lowerArm,
        required this.palm,
    });

    factory Quaternions.fromJson(Map<String, dynamic> json) => Quaternions(
        lowerArm: List<List<double>>.from(json["lowerArm"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        palm: List<List<double>>.from(json["palm"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
    );

    Map<String, dynamic> toJson() => {
        "lowerArm": List<dynamic>.from(lowerArm.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "palm": List<dynamic>.from(palm.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}

class TemporalModel {
    List<int> flags;
    List<int> index;
    Timestamps timestamps;

    TemporalModel({
        required this.flags,
        required this.index,
        required this.timestamps,
    });

    factory TemporalModel.fromJson(Map<String, dynamic> json) => TemporalModel(
        flags: List<int>.from(json["flags"].map((x) => x)),
        index: List<int>.from(json["index"].map((x) => x)),
        timestamps: Timestamps.fromJson(json["timestamps"]),
    );

    Map<String, dynamic> toJson() => {
        "flags": List<dynamic>.from(flags.map((x) => x)),
        "index": List<dynamic>.from(index.map((x) => x)),
        "timestamps": timestamps.toJson(),
    };
}

class Timestamps {
    List<double> lowerArm;
    List<double> palm;

    Timestamps({
        required this.lowerArm,
        required this.palm,
    });

    factory Timestamps.fromJson(Map<String, dynamic> json) => Timestamps(
        lowerArm: List<double>.from(json["lowerArm"].map((x) => x?.toDouble())),
        palm: List<double>.from(json["palm"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "lowerArm": List<dynamic>.from(lowerArm.map((x) => x)),
        "palm": List<dynamic>.from(palm.map((x) => x)),
    };
}

class WristModel {
    String dominantHand;
    String side;
    String wornHand;

    WristModel({
        required this.dominantHand,
        required this.side,
        required this.wornHand,
    });

    factory WristModel.fromJson(Map<String, dynamic> json) => WristModel(
        dominantHand: json["dominantHand"],
        side: json["side"],
        wornHand: json["wornHand"],
    );

    Map<String, dynamic> toJson() => {
        "dominantHand": dominantHand,
        "side": side,
        "wornHand": wornHand,
    };
}
