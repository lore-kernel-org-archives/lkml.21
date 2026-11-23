Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447358;
	b=frajGLfFDko1nxaVCH6uEYpu5AG74apFUi9Lq+b90fkFanyFVCA1f+8JCLeZjbUV0Kpy
	 S1jftn7QJwwK8ODZaXCq7I2ucNC/E4XdQiUywuyJ/P2paaAjNHQ71mhv7Faf0xZ/jyoED
	 nKlLAMgtEXbOsT0lIIRdT8Xg2OB8DnC1UqlboD/jp9xgE66xKmH8CnK/yjgCrNs9bdVHM
	 DU07aISD40/RijtMiUPptG2yH6Y/tlTNHNweom8JQOyA/aDl3juMKeFkKMi+I9MahRy5s
	 LqNX9XmqeECp+QolPE4a5IvudzdS3En4X/pYBKcI903wgo0XVktsxXeD2XHZlh6rifQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
	b=Et3rxX+s9QNFnKw+Zx98S4P/ne+DzXSYYjwk8dlgavfYh15QFi1K9uaMkfWMM5XTaWCa
	 grdDFC9kwSyNIGEKYfm4/7sP/R09WQwKe0bcQK5L//oH8nrew3776BJu9qoBoIdCLDi1n
	 HZz81BiKFqMozZa1WeS8n3xqtFUKLp52mDwGIifxKCjkPKEZzqfgQXOTIuNQ+jfaP4JuT
	 jlEk6ysLSmjR43o0JuyPMCc+MkokMa31ztgJfg/75x6Njqks3Es3HRwWZ/E2X25Jw0567
	 +FMBeWug4iBfiAi7YWXny6GPETiuKzrDNt7cb9ggmSLF/iYIByXgmkoxpUPgpwiLdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hGlKNPG/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGlKNPG/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKu8O2369190
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=; b=hGlKNPG/fxzm3rld
	gNryU850G1nqO933oknVTgPAvtA4pSrWcdSaZXW/reONdtMatxVdc+s/x9VNbi+W
	7NHeqx0AeA/hlEPBrScxqHg98CKOl63zCsTd2NUjjknfyy8iS3qTXpk9NbhdBrol
	c/m6r8pFhlMPxaPhiRKw1XwM/4fKyxfe0vMyc7WDZSkeaC0AT3SaJ/sJIxbK+lca
	OeNqvpHPTMwXSRkmrEBOnbciyKxDZiw/hEF6d8Ykkz1CGy2zfk1RcVf371SG4q+h
	NsgzTbs7/XiIsTwmz2Evn6XQUdcoFLfsdWnrM/3HyXEMI61nuwPA5Iv8Gc8YUSpL
	HlHhSA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa0qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0e878f574so52437077b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447355; x=1796052155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=gs0Qpren4ffJsyB2nZppF82qZJzrUnjUzmbjW77wKv5psLmJTToUlwmuSC3XmE+C7l
         QGSxGSaxhSa1dm1gTVHHZErNIyqbLQrbPZNQGxXW2SLy8zyfGjxsTqpqn9+mYbOMD8Fy
         TWbDZIypyUERbDM+RIgH8doteHgQSgFD/0XE/0/Zi6lMac7QKAL9YVlO8+eRo/CDFMCI
         12zRzE564lYrOWVgcfOofurUA7Cuyu1zz+SXt7XxC382JNsbDNi5SPqeOSxB51zKvAVt
         dHCuv3fs/FmW0jc09eYapOIYkKzbEJHAiyHPHWg2DtIV9op614CtLZ4v7fR8/NrSbHpK
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447355; x=1796052155;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=d3+or/ofawOH7Gd5ICjk9dsD0nPvcMLu1HpHDqYETlpXEYqoc5tHHL3D/XONY54IHN
         XoK67DFu06p/aj7Y7zMsfdv96JN4caKXaVxBJGKtroecVSLOsbRwsIwC3ciJext2cZVz
         RVLVK8FosLvGCY4GoELf79ILe9rIX86DTuphc+ZbU1yRKW8WdFKxcjTFx20Mi9KWWP6Q
         7RAQf+qkoRVoupEUS7zeRVozZ6opkqLsGJYZSrgY3UpGV13W6vyFVnh1Z16D/goIyixO
         a0VPsNb3Zc3gkWsVzCNC8KNgnED/Nenh8mmzskA+k4OEvUVhJWkzfhHZIR+V9NBjLcCk
         P8kg==
X-Gm-Message-State: APuU4Z9Cd50RNRxPV4lDCjcPnHfy5OMIU/MvybOUNcYAH3Lq3AkXYKZR
	vfes3KHqlGTRa5BHDQfASiL8/mYC+1L9+pHwfsnn+ET1ZgDjpTD2YOITgoHaxhcUQCVtn+Y95MG
	YURCUo252Kz8/H/Wzy88MbfH7ZAQ0VVu3obThoYmjaRa+Dl9Ij9Nm8LeUVg7PBEJqdc5sh7Yy1h
	s=
X-Gm-Gg: AZFdTZeD42pdBGhWMVRZhUNqftWcPD77FN14CREx3LOEDpLEnlOHwkxnM1IFX/2vZ0D
	dOZlPPLLMDK9M8ZcCdWxxcpHGcKc+74qfYuXrZ/Lc/Q1k5GqaGXVhuDZZnzKL8LvOJuCgbIonlX
	dynSzP9HWXYRX+Of0WVreipwT6795Spf5eEh/Tg7ePI2LxLONldrPpifxspZvKzRPHhPs2JxXYL
	8SWQWe2NvdgHGhnUjRIvHwm7Xn6KFLzaetM533UmdVk02CK2cPMc39iNXpMCCv7KEhIwhaiuxOh
	x7d0ws+p5rK8bjVax+nkNnKfBvGXCVa1IVjsSRlS7uhjRvYgPJ4h4nRj64fYAb8LCetWB7IfaAn
	J3Gu9RiaBUcSUFzE8CQAzCd5fHK3uM7LLkjrIlRXWsfDUx0FsJL8SOu6QH6vruIiK8NN5/6vSXj
	E=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795507b3.6.1795447355085;
        Mon, 23 Nov 2026 07:22:35 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795207b3.6.1795447354440;
        Mon, 23 Nov 2026 07:22:34 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22927144f8f.51.2026.11.23.07.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:33 -0800 (PST)
Message-ID: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXyCNiw/rApX3N
 XFflrmdwNb3/t6jcXYSDFB7q1gtPEXLQJL9WlHmEF0oNdb/T5yxQAcwpbp4xE+bqHMEUKG9mPX1
 O996wgBGhigcXrl10cpBPIxTQ2cP6CPGVc/jzYm3riWJdWfISGf0SYknIyiVSdLZaOZdAvdWagL
 eK1tpJnY3he3NeymfTLnn7vzjcYKhe4gwq42udocNnnoTZXZGlfcyDKnxwhYsJXj/FkJy578Nof
 OdvsuF7bBKXakuQ0wNhVfUZlhDuv/xnVf6qcNa0cYwwVAfymTWE7bciN+7lyRgWoKOTetkW104W
 tfgWgFzFxXeqxbsw/Xjl4vYgZ/ibMRhqudfQedXJ8N4tA18snUmzjC3cZsuw4cQBQz7xFtB5tou
 zAkN3TKfKJ6+aR/K6j5JjYv1AD0FBFE8yRybZ7J54ZbZZLRe1XF2kzHYnbiOJwWVePUHOXRy8TC
 N1IsrD+YkXpVryX7Iiw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045a3c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SaS78iIXIhQ6CdhXs3EA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: Yc0_LzRUMgMm8ZsKtlryo-qI6RIWA963
X-Proofpoint-ORIG-GUID: Yc0_LzRUMgMm8ZsKtlryo-qI6RIWA963
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX0pm/v7NnQCet
 lT7o1n4pCURhNhsY6danNl7Bj2n8ZfEiXxehuC1xysLsqeq109sq6dvnmZYOc2vW1BLUJOgBnOE
 4ZJrFQreTXA4Kxb8s7+NY4TV1DyF5HI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 23/11/2026 16:17, Konrad Dybcio wrote:
> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
>> This has no impact on in-tree ABI, but any outside users would be
>> affected.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think we can move it altogether, to prevent a situation where one has

We cannot move all, because some are actual ABI. I could try to leave
these ones only, but that's a bit too much work, IMO, that's why I cut
everything at ~450 value of ID.


> to take time out of their day to analyze which one of these is right..
> 
> To me, this is the same case as e.g. glymur-ipcc.h where the values are
> some foreign constants that are specifically NOT bindings



Best regards,
Krzysztof
