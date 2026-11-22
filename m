Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372924;
	b=SZXdql82tAIQApCGrMXfsYqZw8V4owY2nh+cvyLHYv+YPKe0K0MSyKfDEK1bcoum/Dj4
	 muUcI9xTrgcycsrcD+ohgpPPwCB+Zf0pSIbUUZUZS0ItS48jm2PXzEpVaU+1z3W60egsu
	 dQA7Wm3E+hZCAd4WpMiC/1PxGyKu5/sPrXxSkySRx/4DXxadUQZOqukItDvfOrAjP3htH
	 5yOEVRlHpWCeNfiYIKowHJf9QpOweRzxPs1gCuToYyIyWgol6M07N5CwhwPO+/S1QZoWn
	 1rMOSL3lYmBPmvx2wOP4K1VAJ1padQchku4NN1rhEaqM8eE+YTuLLXsUI5T/F7dgkZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
	b=aevA9TxM4WJ0fzRhG8sN1WRKrzZQYjPC8dbQI6C0YpZreDqbE2u/zgILsxvGL55jTjVI
	 cn+1nrxDGsXghC1V35+FzSGl+6Hytavw3q/FyV4vBrczIpV00abvIMl33yYIAkEGUpZrG
	 iLEyscQNG47KwOytHe/Wiv4TsyTOYp74r5MnE6Djs8R7gF1kgY4xIRnWMMlu+AdhKA0Ne
	 tOZyVHmgAIy1/9LTjTmbvIFkr0dWWUg/z5pjP/pG/NcOPlv5yFPvs+w0Y9hPgIJGlR7YP
	 UxjRL22GoKEjSDh9UYKcUatXY1LdCJB7c6UPEilGvoxiGP4LnqL9CNigMMpFmW5eyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853D606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A853D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVeWi3629722
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=; b=N884gzRysHbYDNL7
	eYyvrHAWLxssvbmjGZJYjEW1RkNykRyP5O4/u/dgWOK2y2WI+XzA6+7LM2ASPVg6
	tg3viHG83yZooUQwT0qGtc0jS96bKbFfMsc/NDwWaAwRtsXrv0UAyvBzNqYu6rGa
	nu6SO4AG0nO5TMYWp42/VbSwPGGmQemh2Yd+pGnpdI92bmi+ePcGxzt5HtiaAc2k
	WnqTekWv8rjEgh0AJMf/hhf3Y+qseNzWigL24D93uErFeRF5D1wmwuCv+9TWxg2H
	IxBP10NF/+Q0cWAbYQDrerp1YaYkxpwtsPcDEX6/TVwK7tQuKKKFX5ONDo4tQFoX
	CFRIiQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc3en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso4967820eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372921; x=1795977721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=NJINvd5zC2KK2VDLpbbFDblfvBxWreHrAD4sFpuEJPCXu4jHGkYERM0CWwve0nAiQf
         jvJnTw1ZrCHHorNX9glEvcTNOD5okPY6uQyWXd3sh1rDS75rr9pRDbrHuQzW6FPrNgf2
         P5oR31su4jpdw2Io49cV7unXzYP3yQA476B52fjFP1HpDi9ZO030I/kYDxG1G9un/UdJ
         NzDqF6g/oL7lN+5bwo+1v/Xv08eO5A6biIKzZh25EIVE91vaNJ9vRzDGuA+0lD2HxYxH
         +a6A461N+IhvZ40VczWYdgjGiPrvPg9IcURHKlXgrL7pXmbOw+L+0FhyIyEtr+ut2/8x
         MuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372921; x=1795977721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=olQY8vUuastVRKqcD81XLPYwSHUdfx8LNS4Bz3xM6M+Yg704nXnEQ6/N2pajVeL9ea
         dJhW/g3J36v6RjcNLnGE9HzlVh0NEGPRP/itkc9SFjOAmSKkJkcPsr4VQ0BvLtJ1aGTG
         BnjIAljXKld5sP3jiZ64K/vNJ+nYYLh2L3eGCo3pblT+cwvef+sC6H9sco4zDvAAqhno
         VFz8teKchWqeAAfdB//qPmQI/cAFa8YJ+W6MYcWmxy3p38u61K8/KSGVeRmO+0ze1rMF
         mZH/mex5P0ZOFb4iACGwt0sMq/XAai9xaZi9EkVfSUUxH7UQrKmB9dZW1Pb04d8DBjLj
         0aiQ==
X-Forwarded-Encrypted: i=1; AL+hErFIrIg6I4EYfBoqEUvOYxtMlGSovnvGc9h9uGN5ksVXCM8fswe79AlSq7yCgspdclCl5yQnsqh4HwpWX00=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XaJmEIHBLVamLYCNPMpSkPkTT3zlUXCAoAxZ7usbIJ3I+dpz/
	ZWaoNA3bGema2eSvwHvS1if4YcfV46ny3eUESAX7Gk+d5ayFB8HrgvF/Yw9Cc22tgz8hVqgCPZx
	ifoUAuN4pvUBh1lbfhkI1gukW0vTayYg9l6eTuSLI7274k65tmb6dF9dRu5h+FZMLTns=
X-Gm-Gg: AZFdTZdsyBaiGiKF9RILT8jktEkchODDcvXPYC/1/O4cwTyjqhwD8fFTwwLuCopejwl
	m7PzKpmYdj5J81iQ+y9tMDeQXYjg8XdZ5pYZ5fTcy+061Ixmb8hQRIlwukZIrFNgILD37K+V4gM
	eWA3YetmLCV/wZkCudglYfdYSvtk20OQBPqirDVFfBOVKduxu9SsxJK0pQpJoaXm36tztahQtbX
	txyggDrmrf8FiYFZY6yBFd3w5Z8T87Mjb1bP4wkDRbhiFRqXcus/vvYmYEKgTCAhkjyoAyaOqjt
	RNeI3Iaxs5Sfg6f0FNV/JZdYVGRwCIIWEj1wxvJfEAvOnLKm97GwVCXn9FwHdOocNzC65dU23ny
	8LcL4qXcuWcw9+70PeR9woC690T9hLsGlIpdK6zG/1+fxqRxFwIxQuespb9ep/u3ykoK7gVpYPI
	GMUdjk57Oe8g==
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446363eec.34.1795372921424;
        Sun, 22 Nov 2026 10:42:01 -0800 (PST)
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446336eec.34.1795372920922;
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:32 +0530
Subject: [PATCH v7 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-2-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=1112;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SZb8f4y+c8VKXAmObSVzyBxPR3uylj62lbyHSZIa09Q=;
 b=uuVTYdqXCo/Q0EWrQyqZWXll7bsLsYN5dwGnkov6NB+7G2v/fmXfsrJRS+OYu/K2nFHYDy6Nx
 E4mpaje6/ghAjSZff3MxT7d0OAWMfVUNBrigQ6vcq7E36Qtt2fp8v+i
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX8fxv6HsupBbR
 Qb+fq5nExCkAAkfbQUiSZn8Ghsr9PFmfY2wnq6YbTfuAHueElC/vXiOdfC/vl0y5/P3fSd7hYQh
 F29SRRbAOcqeSvAbz+FfP3UtXHa96euNkcBsrOb56SBFVRJe8VDR1VcB8ADRDudDYLzNnFaS1yz
 WBigIYnGibWrt9EIOcTT8l1ZLKnUPJUKIcpgs5b2bjjsH9vUxTOA6chT6dk9cmSrIn5p8thPyjg
 JbpXkJITH7EIWTq+P6ghY8oxt7PRw5xfgIldrxUzDEUB48mESUdmU9iKzEkWJETzETDq34+Ev1C
 bBBR8Df9SF4D5uTJiamR3xEQC1pdQGugS1k7mhKrMrsjfkpqTArNV8enMpHVw7IAMPqLlex0IfS
 AA3A97Yo10pqwHl23t4Kf5Shqvshu3peyb4CI3VmW+hDrZrFJkaKz2lTIvVRo/76PpF27KLU0gk
 AF8wOLvE14epmbPM5pQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03377a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX9HOqNDYyWA48
 2YCp5/OQMagHREAEAsnlAU9hesyeUL+e0P0bVFBGLQ8dRCUYaJ/6xCZd/cNLKpTcTjyxz9B/EOM
 a8zBUjS0Hlb7l0uUKjGwfAkQjFZD/iY=
X-Proofpoint-GUID: Uuit57iejc_6ItoGy43qdzaSI4qUQCMF
X-Proofpoint-ORIG-GUID: Uuit57iejc_6ItoGy43qdzaSI4qUQCMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Fixes: c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2.9")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

