Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787540;
	b=hcSppPrcje4xPWBJCWwYi3qyEVVM/GhKP5VAZraPRbncQEvtwRBiHgtjOAlsZcni75vg
	 gNsxnxZ9FjUEAU/2p47Fu1O2/DP3/jH4s+tu90w/apFsttLfVZsIQsItBocUYAHvLYOcu
	 8P3ZTxROgCDmwUnnEVnh1H+7VuoZ35uL59mIOn59DhZUQ5q+4o6Lh62jEQH39z6oscd8C
	 7pSU3qwnqlZqu1AY70IKDo2osVA30axOR4RQYfLF0uGFmILIEHPSbdL40No9CuXruhDYr
	 uNrLLR7MTH5n1DO8IQewbh0/a38QkgYvgpHzkg99CFgNLi6Ek0dQEbKA3wxm9JQyG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
	b=qBCRmrpYh49blgh7py/G6eA7qpw4lUL4e+ht+FdzdR6XWTK2lCxrlAw3LlX6yzZLTT2O
	 PtU6i/5JfZC6SHK+mvB91x5CwJZyrKq/I81ilV+FQzYCkZBGb5/HxCudxc00muMdwWXts
	 DKmfH4yu0T3+wPLvLf1gtBWHcO5XXaA9Y+Bu+CXoQuqpvgta5rVXY48WF43YE1nmJVD05
	 3+YuEpurHSy6Dhrm8lfFNv5IzN/RmqkC4PmitbZ5rpL9LcfeF7C1RWL6T0jYaZyPi9ITW
	 RXdEXDN7+7ZjbUAFYOYFjrlLwsicWLhYkWSl39WBTy3dYst/0tbeYkwelAja1XilOSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h0tkHij/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifHX2TKt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0tkHij/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifHX2TKt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh2MM1292719
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O5xD+8eMDF16hwZZu12S3/
	pCswr+wuLD/806G2DAhCY=; b=h0tkHij/4SY0eDvBolIGOzcNCa330Vva9CDhxU
	6dPCSk1pdi8pe4hfmjia5P+Y6jj62Icyv8Y2fmdmHaTW3E95qUblc0ekSbSDFPZV
	b2dIGVQnb2YxZO/rO/mpRiY8AObq3GthE25MdVvqa0RJIjZdEJ8kLOCIX2sSRVF7
	E5aWpgQPD/eRsnu2g9lpoxeUGuwcUVK+k766+6sX3f0Yt6rUgULfOet0ehKISFPS
	lZ/fpgD5mHESWJpWZOKSci9hOqM4AxATc8XSfIb7cxGzoMsLwMj5v2bOBKaaIk3W
	bnhj5LYVYOKtLI70cpTkoUSQSbUM7q8C+ic2mZSvSmspGiOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqm82v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:52:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so6039662b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787538; x=1796392338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
        b=ifHX2TKtC6JkkiKwy0XUloRYyVlSiamUQZMXAdkdYTBmzkQf8Qogd9Vdomp3YPTJde
         Y96j2XNq3jxIOBInX70DkanYBqOdfihoNulL7c3zP0kL6L2xA99ZxA+XGrcMjumxIhYn
         0+ci56VtuBZgjS2ejAqUkVqjEdvskZ/YSvsFqlcnBN3o4e6zhey12R3IUKbBNHY7miTx
         rYJv4ZnkRyF7aMNu9sinCmEys3FyIpWAqQME4l4rpKaIZwrJtZdDXij8Y1lrTj0wJeqd
         DQYxasX/j3WSUeqZMBrLWoLg+CbwkVsWz5ydqYB/K8q0LSSJ/Idzd3r29c4BbnToKvYF
         snbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787538; x=1796392338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
        b=KlNCeCiwAOc7rX6ijolc2l09aUSnPFdnHvo9oHgC7/HUYKHm1dHUSRkipfGZc/isWI
         4rxdoPwPj3BVYUfHDZQJTm/iBLAO0V6VZyBrnKMcBatz3OP6VO3uES+/jI4KkMXVbjwg
         Pva3enWP19RrkeJaSjXfgudx22smd3tcZ3QHSViG+fjQ2EGgm3znSiMOPt9/qNRNz2Bj
         DYW/u6bt1Tt1Lojxwa8kbMenxIJ85fsV4dWttikhURIl5IKrzJ5kY/pymDEzH9UzEtl3
         nsHLK8NjZHHndH7whfHrUbjiFQnnFZrqaSLij03EBeR3ZhPI6J2VAecSe5BjrcsUpPl8
         tbDQ==
X-Forwarded-Encrypted: i=1; AL+hErHKCXQEVFgnsWYORAJBUBUw4X42jPievVAbO+hSwap+jpDnwdjeBShWiQHM4YuVrD+zJOO8P2AqkakwUPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ylpzdZ2dp32Y8bBsAQlKU3gQZRs7vB0iLuP93smq/NpJDaPPl
	7fUSbHKIcCViP9ymWnJD9Qn5+DgO5hw93A6PesLMuXI47W6osP0JSX/h24yhRFhjIotzSRbvgkM
	V8tjrxdka/MryOsEIPRH3HWepVYZgIEVMyAnv4ZamsD8sT+NI2LgyAJdwi8gdP5EhyTI=
X-Gm-Gg: AZFdTZeqAsL15wP08ma0SyDOSYIYRp6/a6s9G9iHqUrk2BRK5a/sN4pqKHysYeuYsj5
	i9ovfHd9pW98cQGJ+S2W3AhUz27P3/VJDkewiKDSmcDPuWcnyG+AHYMstu7OlpDuOpHGQf3fM06
	G/nldPEdv4I9ThrRkB229EjApjfISJDNOZVvuhHF+HK8zYC0ZcefOx5CHG74wnmfXKCjnmJ7yb5
	kyWcUJF2ROD2CNtnfy+ftvlQijcxhxQ66HaZv8/X/SoX4OJn/AX+h0N7CozaOLAOWtMoSxhadI4
	krXwYOHpc2t3l3MKz70lpuK+j5fEa9cvi2fjD6tjX760tsI49GRdqwsDuvKszYcfPfztBbPZoPP
	RpA1ELrBtLoezQQH7Tki3m3ykDl4mC4Rsf7yYqsZ3Kc5ELDcdscHk3CpKVkUo9UhAHkzx897pFY
	TCcvw=
X-Received: by 2002:a05:6a00:2d96:b0:890:e6dd:52ca with SMTP id d2e1a72fcca58-8c87d228520mr21817232b3a.47.1795787538038;
        Fri, 27 Nov 2026 05:52:18 -0800 (PST)
X-Received: by 2002:a05:6a00:2d96:b0:890:e6dd:52ca with SMTP id d2e1a72fcca58-8c87d228520mr21817187b3a.47.1795787537475;
        Fri, 27 Nov 2026 05:52:17 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12747353b3a.2.2026.11.27.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:52:17 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] ASoC: codecs: wcd9378: add non-SDCA (mobile) mode
 support
Date: Fri, 27 Nov 2026 19:21:46 +0530
Message-Id: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPKKCWsC/yXMQQ5AMBCF4avIrDWhRXEVsaAGY4G0lETc3WD5v
 eT9Fzi0hA7K4AKLnhwtM0OFAZixmQcU1LFBRjKLY6lFm4jDdIXSufCKVfDcZDpXKfBntdjT+fW
 q+rfb2wnN9kbgvh8bzyEWcQAAAA==
X-Change-ID: 20261127-b4-wcd9378-v3-b49611a67835
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 96rQPHcQPHy1ygnqK3Z9bNF_eqBGOvOZ
X-Proofpoint-ORIG-GUID: 96rQPHcQPHy1ygnqK3Z9bNF_eqBGOvOZ
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b098b13 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=T4HdZaMeGz766qfeROsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX0+ZDTEzsrLdC
 vjdg/6ibCjvGd6qof3OmHMgoBSjwmKhYI7YeHjmYKN69pkVPkPXrcMRir0NHPATkwwGNZTPS4aP
 oTqLUpoOXwcYstaS/7Mt3Y8ORBh8nNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX7u/501ZqMGh5
 kfgqOQt0mzqHt5X/nYs6OrGTd+MRR6nxcYUBCsFnIeWxqQHyimDrjRx9v/89p2tRtb11WufqqEd
 FvxXg5vnDkb5XtIlupqCkKLaJ9bEZUM1SPUqUPqMExGuNulXU9x3+DS/NLUMLTfq2luxier+IQu
 SG2M+Lv4Y6XXL//Ux4bJKmoownt7DzZfeVc1PTC6NPeRXy3SoRPGGDcxdSFTUcXBJk/h6aZiufw
 uJQELQ6SHRQ/rUNP/ee28Pb1Kbh2MLV6SEVmlSb26jQPjQ0lWqrSPaNQ9bNd7HQU8TVxAqi4jYQ
 1wXzSBPBSRpk2LYWpTHJdHWQPiNr2n53LKCAzCWqEE029xFWbh87yMJYbeLccGvykGpjHcDGSeN
 M0MdSYzfdRsZ8ZUq56WOqITmI4hDrt55+aYk16e5YLsm9RfS/E3pisD9gr6wGLZjcSuGnh61N/i
 lrN2tgU9QXFFIRhz+gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

The WCD9378 is the audio codec on SM7635 boards such as the eliza-cqs-evk
and the Fairphone 6. Support for the SDCA-compliant fusing of the part is
already upstream; this series adds the other fusing, the one used on mobile
boards, which is not SDCA-compliant.

Which fusing a part has is decided in silicon, not chosen by software: the
same die is fused one way or the other and there is no switching between
them at runtime. Both fusings also carry the same SoundWire class ID and so
the same compatible, which is why they are described in one binding file
and served by one driver module, dispatching on the existing
qcom,sdca-compliant property. That merged-module shape follows the
precedent wcd9378-sdca.c already sets for this same part.

The non-SDCA fusing puts two SoundWire devices on the bus instead of one,
normally on two different masters: a capture device on the TX link and a
playback device on the RX link. They are the same part appearing twice and
are told apart by their SoundWire unique ID, reg = <0 3> for capture and
reg = <0 4> for playback.

Every control register, the analog core included, is reachable only through
the capture device, so that device owns the codec: it takes the reset GPIO,
the supplies and the mic-bias levels, registers the component and the DAIs,
and reaches its playback peer through a new qcom,rx-device phandle. Keeping
those resources on a SoundWire device node rather than on a separate parent
node follows wsa883x and wsa8840. This is the shape Krzysztof asked for
while reviewing the SDCA series:

  https://lore.kernel.org/all/6a901a72-fbcf-4478-b798-e5f234c5e9d8@kernel.org/

The Kconfig symbol SND_SOC_WCD9378_SDCA becomes SND_SOC_WCD9378, since a
single module now covers both fusings. Patch 2 also touches wcd9378-sdca.c
to drop the fusing filter at the head of its probe, which the shared probe
now performs before the SDCA path is ever reached.

Verified on the eliza-cqs-evk: headset capture and headphone playback at
48 kHz. Verified on the Fairphone 6: handset mic capture through the LPASS
TX macro at 48 kHz, repeated across reboots, including UCM-driven use by
PipeWire in a Plasma Mobile session. System suspend/resume is untested and
is a known limitation, described in patch 2.

This is a respin of Jorijn's v2, which he withdrew and handed over; his
attribution is carried on both patches.

Changes in v3:
- Restructured as an extension of the now-upstream WCD9378 support instead
  of a new binding plus a new driver: the binding patch modifies the
  existing qcom,wcd9378-sdw.yaml rather than adding two new files, and the
  driver is a second entry point in the existing module rather than a
  separate one. v2's qcom,wcd9378-codec.yaml is gone along with the
  top-level codec node it described, as is the accompanying
  wcd937x/938x/939x and wcd93xx-common binding churn.
- The capture device owns the codec and reaches its playback peer through a
  qcom,rx-device phandle; v2's qcom,control-device boolean is dropped.
- qcom,port-mapping minItems drops from 8 to 5 so both fusings can share
  the property.
- RX/playback added: HPHL/HPHR with the per-channel companders and the FU42
  channel volume controls. This was follow-up work in v2.
- Kconfig symbol SND_SOC_WCD9378_SDCA renamed to SND_SOC_WCD9378, and the
  redundant fusing filter dropped from wcd9378_sdca_probe().
- Clock-stop handling reworked: a runtime PM reference is held on the
  capture device for as long as the codec is bound, because the SDCA
  function engine does not survive bus clock-stop.
- Both soundwire prerequisites v2 listed are upstream, so the series no
  longer depends on anything outside itself.
- Rebased onto next-20261126.
- Link to v2: https://lore.kernel.org/all/20260729000649.263426-1-jorijnvdgraaf@catcrafts.net/

---
Jorijn van der Graaf (1):
      ASoC: codecs: wcd9378: add non-SDCA (mobile) mode support

Ravi Hothi (1):
      ASoC: dt-bindings: qcom,wcd9378-sdw: add non-SDCA (mobile) mode

 .../bindings/sound/qcom,wcd9378-sdw.yaml           |  172 +-
 sound/soc/codecs/Kconfig                           |   23 +-
 sound/soc/codecs/Makefile                          |    4 +-
 sound/soc/codecs/wcd9378-sdca.c                    |   14 +-
 sound/soc/codecs/wcd9378-sdw.c                     |  636 +++++-
 sound/soc/codecs/wcd9378.c                         | 2201 ++++++++++++++++++++
 sound/soc/codecs/wcd9378.h                         |  324 +++
 7 files changed, 3311 insertions(+), 63 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-b4-wcd9378-v3-b49611a67835

Best regards,
--  
Ravi Hothi <ravi.hothi@oss.qualcomm.com>

