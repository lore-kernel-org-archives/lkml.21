Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502653;
	b=uhkUS7HaomvEYth/cZ9zb8jpzGA+at4vZnzmNFKqn0yJchhve0aQlX1ZJuZrWnMzgVzr
	 x22JLr3gURTvjIhfw+nfvVRWdoxodQVC98pl0aKLGHUtc/bnUywdAU5/OFiM0NSWxI7dm
	 sSnzx0uyTQvx3QlTM7kL66YLPj8MfCB95chDoe/RUxLu5aWUM69GR7yhFws17JTvgfIli
	 GihGww4/jL3sCI4eOxFxRNWfFXgCFNk+HOSIhDIDmWjhJHpdDlJVPQ3HTPhWCRvPMspva
	 imb5MaxpBg3xRt+pyLEpg5GThh2Z5u8KTevfR3zdEknLrDDc3Q/9qfqL9qTisPibZHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
	b=yeV/mQ/qSINpUUkCvlx+yjyRaHnsxuKwhZNF5Wdkil5GFELGLkTrLVcTEAZgUceOU9Y2
	 fDKkbHlJIT0sU/KONBO3edTIlqdkgXm+/Q8DQ6eCvG553sIkyHxoRnH68xH950+4aUcLP
	 uopFBTdvwGrozBVxXidmCBuV0ujImFW4vgfbTwnKy3ccyJQyt4ZCs8zcgPZHItRcpanCj
	 IMC5NJy4l3rt/PhTVTr6KydjTr4wWXkPAgSjvXTT9kwA5gnRW/7zLyf2jlBtaWgeWCMXP
	 271Vn74F8+Gys1tFInZvrN66Chw39RBUmpubcoQ6k9DOV5C8k2z19bHAXQEdObC9aVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBjw1Te+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58CD606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58CD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBjw1Te+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2ldmu1598158
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r0ByY2X0iY4Mpi/euGIX6Z
	+pt0UGNEDDDpkbV82aFgU=; b=KeUZzUi8LBi2ZjoH5n+PnElc2J7ns4yoGnGUXk
	30iU0Cw+cM0uidj1aWkDFexzRMktgs9pzNaYxLOj+MOzZCnNBVK8lZ1x/Sf+2Cog
	PbdzJm+t/SjepQ/OKITnPy9QoKyu/OAdRvUY29Ko6IeL2NpvrhhlYrlh84i523fu
	s19Kxt+KyE9OVc/6GTZpE5gx5hr9NVjcGO8YTdx+py7/tFSTEJTkBwVQS9ZXfKlU
	StLFVUFhsPUwkv3l/X5qV565+Ce4nqzOmAlRU8XNqH2SYWDv14L8IphNGfeHp6q7
	c591O6AqiVWDwbLjfwBmY7Y9sE1nR2wODJlhmQuLUgm/rr7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj6f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c1cdccaaso297181eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502651; x=1796107451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=RBjw1Te+CwTRvukx2eVWfNN92QF555cuqr9kuP+GPzCFMaGSaqgZ5Fz9rV39VwfY8x
         rTbtGU3FfHOyz1qRDMcn+NPdyhCZj42djegYLj7SX6RAJz5MgdJdmlFDn087RqZ/6XKi
         FEMIl3E1qsaEpEaGboFUmRr0naI4uVAVnfVDvpCtqNQBzzYOAhYrVU9yoaCARFlnFqP2
         BIjlE04BRIBRJ4AFnaCAlL4vwJGP4AjjvG41TX/IYDJHsQDdF4/VBPx7ib0yi466PwVC
         9psBcRhuhESiFh9vAZRTDVcPyut+Gm/xMpXHUUi7dP8dXXzZUu60LhBDWhvSPA+myTEl
         pOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502651; x=1796107451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=r7u4P7Qs9Lm2pOZ7zL/no/f0iFeTfbf39b7OMVqjzLALk+s1f6PKv3TgRQQF+rTVHm
         arg6u4wP3CJyrefBQDBcecgaWWJxEyLG7kLij7CVtWFJzDcWatRTX0Mi5IWALFBKsoaL
         M80qyGh/oGo1fOrG1wn6UCP286f1qd2JXv9eYeQqZF336tLZvgL1A+NW+9Vl8LJkV9vD
         0N+T2D76zB6gsbXl6MvHeihjptJMt5R5Tv3dCeSSTeaZnzw4UJ1bjH2z212PdKf5cMQH
         X84pHOI35YQTkNlJnz8+6GLotqR4stf89KmXWiiZk1nDgOHnp23JyohOinUFj4PrrbuD
         cngQ==
X-Forwarded-Encrypted: i=1; AL+hErH4wF61c31RqabT3YrPHqL8rH88qWSHjHbyoX6Hhg7SwVj2vYIV0GARLdojJxghzKnjeb0v6aiC+TdGnk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+V8B6/Ty6h/DW/pdFZb64WcV/lRqNDoTxlscA21sWA8Dhlx/8
	Zhi/8S8t5WGY4gDc1kwTW5QzBEvWdwNtnbF95OP6iBUQZeMaBx6ohtPiny1/tHOTwpfgd/ai/Sa
	ovIUUEiK4+gKjK7+111OWjmUYGSEgGtbI3V3HiiFeMiPGWL5mP2c3plBtekhAZ7SZWfU=
X-Gm-Gg: AZFdTZe478TkltoGCTIuFpNglbb66sHX/Tvwv303I43ClJjrOt4f3xyWcfCSiVKE+JZ
	kgP6pAXKDPYrWau/qQh4OXKEqtn5c9RSWH3olxONKcKeBHJHpcyAXk/8yjT1y75WK1Nuynjncc4
	tr9kQPxhaQpTb4Pc0G3S3oCTzL4HHVdmpwhkRTkpFPnKLCrxuASlmB+chiNVF+AQh3gjwFOYEj7
	i+BEpRnjE7UDbAt8aNSFitc6W+6yVQw0lcvUlF/2XubJaeSeoNNxeAQRkH0j16FyNXEIj9jHxC8
	3Vdx+xRKO3j71cgNz9j/oX26sgL9v5E9eIZhlHIebtlEGQ3ANQuCHD+RInrxFEA/V4UOHGBgcE1
	Qn9hkdypCqi9/M8A8QILVV03tGP9XpKArfT839ZAxvI4RAfdfVPfsOQCdNwx5PlZMiddIUTTzha
	Jk9h1fXZf5Q3h84i33Rpvt0+UrRZsD46LG/w==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860149eec.2.1795502650472;
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860096eec.2.1795502649741;
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Add support for mahua platform
Date: Mon, 23 Nov 2026 22:44:02 -0800
Message-Id: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADIyBWsC/32P3YqDMBCFX0VyvSmZGI3Ksux7lFImyVgD/mwTl
 Zbiu2+0lwt7M3DOMGe+82KRgqfImuzFAq0++mlMQn5kzHY43oh7lzSTQpYAkPMBuwWvPvh4pRF
 NT7yiPC1RoVCKpbufQK1/HJnny1sHui8pen6bbKAY8Yhuss89WdSg+a1/DkvgKwAXnIStjK1Ba
 SW/pxhP9wV7Ow3DKY2v/Y3BSHx3/NxkwtVOONPK1jnbtkVV1K6UOdXCos6tEoWSuiRgO1Dn4zy
 F59F5hYPon3rrjmM0CE1gjUX8g8Mu27b9Atvn5X5KAQAA
X-Change-ID: 20261113-mahua_iris_enable-8e3026a4a044
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=7521;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=gUE63zVZIVeUvmErUr/TrSMTqv6lxRJ/fp5Y8KWuPVk=;
 b=Y1VZuEAlW8OxZVs/P5hijwld5rvuRABQSv4jF35P3GPgC1wI0Liyvj8dL6a7vzpi+OfR+zpU2
 uUCeSoFky6SDjvqu3IcD7+jiVH53dEAGSc6UTU98lk4nfCTFoXJT5nz
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b05323b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NlngLaH3A2d4KlUMbl8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX8I0fd/HOfIA9
 oNiltBoe+VIdi5w4RSw8iDlT5m2LY6mUeRL90KdV4g9skrJhqspKMFrQ4b6Dc99XgpNuzApqdJy
 kltzfkbnhqDpzPZhPLKot8JJ+kE5SweUqdNCXuvUDdZUtMLZvVo00iSwrucWMntRkqtv0AdJ3DK
 h2u8a3VbxZE3DFTlzc/6eMCtFUf097qahSxjO3qNEUKFM7sUaS4ihPzDQwQtVG2VBSplrqPXaIw
 Kci7YOoXosjKpjjsCgpqndWUCLhtWSiYnJjei4WqCupMjTv9wQLQmaAiadCMCLjvTtZrr2nKmTM
 RTXszEHQr/Mo2FvZHfz8TrAY1F/gK0d9h+8uYqQYMwUz5fJGxn6O4oxvRiHc3/OOtMnmuZ3qxVt
 Y2BhBW0GaEaEBNpZuJaxKc01e0Mbm+8ckFw+RgWsk8StXQIdo3cA4cmustmb6BkchMFnUXio/SV
 kfKMSf16grM+26cIDLQ==
X-Proofpoint-GUID: 5Ejpx0S9LIDyIJTfk7mhGW2j9Q-Wghd4
X-Proofpoint-ORIG-GUID: 5Ejpx0S9LIDyIJTfk7mhGW2j9Q-Wghd4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX5NIGft7tuRJO
 ECD3Q4gBkHE5POI3A4tJv4nM+MlwK0YAEVbkFAqCJDLf/6Mg0syMhVu5bUdPv6OMk2DwfB7p9uh
 a3Iuc+CDFbu1j89dg9ARtH6tiHz7GOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Mahua is a derivative of glymur video accelerator with single core.
This series introduces qcom,mahua-iris video driver support.

This series depends on the Glymur Iris enablement series:
https://lore.kernel.org/linux-media/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com/

In particular, the qcom,glymur-iris compatible and the corresponding
Iris driver is introduced by the prerequisite Glymur series. Therefore,
this Mahua series must be applied on top of the Glymur series.

This series adds support for Mahua by:
 - adding the qcom,mahua-iris devicetree binding
 - adding Mahua Iris platform data for the single-core configuration
 - adding the Mahua devicetree changes required for vcodec0
   clocks, resets, power domains and operating points

The series was tested with the prerequisite Glymur series
(and all glymur series' dependencies rebased) applied locally.

Compliance test for iris_driver device /dev/video16:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : plat:aa00000.video-codec:dec
        Driver version   : 7.3.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video16 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
        test DMABUF (select): OK (Not Supported)

Total for iris_driver device /dev/video16: 55, Succeeded: 55, Failed: 0, Warnings: 1

Fluster test report:

77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
141/147 tests passed while testing JCT-VC-HEVC_V1 with GStreamer-H.265-V4L2-Gst1.0
234/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
200/242 tests passed while tesing AV1-TEST-VECTORS -d GStreamer-AV1-V4L2-Gst1.0

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v2:
- Use iommu-ranges instead of memory-region (Vishnu)
- Fix dt-bindings (Krzysztof)
- Fix order of patches and iris entry order in mahua.dtsi (Krzysztof)
- Update to maintain alphabetical order (Vishnu & Krzysztof)
- Update cover letter (Krzysztof)
- Rebase onto latest linux-next
- Link to v1: https://lore.kernel.org/r/20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (3):
      dt-bindings: media: qcom,mahua-iris: Add Mahua video codec
      media: iris: add mahua platform data and enable qcom,mahua-iris
      arm64: dts: qcom: mahua: add iris video codec node

 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  67 +++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c |  44 +++++
 .../media/platform/qcom/iris/iris_platform_mahua.h |  14 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  33 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  10 ++
 9 files changed, 374 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20261113-mahua_iris_enable-8e3026a4a044
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

