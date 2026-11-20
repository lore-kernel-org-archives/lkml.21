Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192681;
	b=VMuzN3NQbFwqj8g3rfnGHCtG//YIv3j0uofxmeoJJYqZ8jUb4strwwnpaRR4HqDXwaVy
	 FkfjbprknLZZHG4OTHrtBaHKqakLkR29Y7KE8uiiXCD8VeqTVdVuKZA4WXQhtP3v7Kftc
	 OaJnNLSLlI8Dqo2O0Sruim/A2XLZfP/swLamX0vnIHBmXWNQLBwm8hRYQpwh7xDSM/nDO
	 3SpF4XGbxaU0S5yzwPF753+pbxHc57kv90aypzrvXxu7vvZQlEO7C5ie/4998cCtOFiIh
	 woy/N9jC73BrzXFWqzdVQ2C4SlOo5+HOxyBU6R8qFk0bctBB5T/pSAWPLNGJ4YIsGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
	b=xH1R5gRkERurDD+l8JaTDk+jDbVE1+pvFpvDtpBlpcKCIdKMCnM2WdIZKcMBKLN3VMsY
	 clA66yYwFyoD+Is4rd6CWGvtHbO6aIzPmzt6GQMoAp0Hrh0cdNmSEP2RCqNLD4yoODQ/8
	 //VIksoHQSLUaXFKXuuCinQCBQo7ltDJE1gNWCnEkgrtLicKcGY+NH5G479jyYbEA4T5J
	 pu7LSN4hM/aKm4QW1360qs/ZzOOs5/vU40n0EV6C4xojjtgKkeLTOgBQq7WHmdpYbL/KL
	 qA/0EzuKIHMOTdQK4vaenMn2lK8csaK2gkTNXnhHL2ttrpgLP+SzRaSsXzML3J1tXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hBU0wz/o";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A7606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245A7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hBU0wz/o
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfaCR1527701
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=; b=cbQYfoMD+GQcpZxS
	rlIZUpYIQlvhma7yPSBFhusrwy8tDbW15fXjjcVtShKcjv08z11Myobh1Amm2iMS
	OxH9HEne4TC45tin2r5NnRXXFFtRmu5YEn5FkwlNwi/Ad3rGV6qY33TnA1wA6aca
	kUxEBmnsiwM8ngBh5Xuopo6kqMJbsVS+q5at+DkRFvzI/TuYF77Y+bzP3WaWYhh2
	q+k3Qz3Hoq91G5zRM11QpnEvZeNNwugxVJeEd7UOZl2jiOPXL5ll5xu6KOAF/9H7
	784d5VxLHEWI7pRR8MC5p76aIPEEQ01eAIkccVDIgXMkx6dpc9FsO+tHA6xFMmKo
	TAzFtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqtj3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:38:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso588018a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795192679; x=1795797479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=hBU0wz/oWdMSxBIhlcw0C+YHkYMAfk8r4saZ3Y1ZwbCcCa1Bo237cZIpMV6lfXeXFc
         4ZbOyxZnNq3A5cGYxExRS+vUzilVNVfRrCa/18Rbgm+P+wFiLTXAOyBDMzpKlt075yBC
         kYIgU+l60WUT/ubkEfn6IdUWiX6OLkt7K3EMFat+xJyX/4uiU5HSUmK2wlpoRzOJMwqG
         1q+sFxqht7ugN5L7KJzc3ecHLSsjDKtXPU/mv+1NLuADA6u7ShGMU1jix0G7gbDkWDfv
         GTT0cpbyTsxrj/FlyUKQX6voFjgG6kMCCwCGUUL80FTBt43d9Fv9lUbrjdX9Xg8KlNub
         iCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192679; x=1795797479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=eGumJng53zGrjNijJkKKCjq9QpiTa7eKkDf9ZOSb8rQS2LlOfw52FM4YchsKdVerd5
         Ci2mOBu739LPtwDzcixiKQmpiwA2hmV7+TmhuezDng7aZQwa3nKt+EDKwSe2XkteeumB
         TNVFmhv01v+1cISxLSj/SOX5xjfrQyPDDeAQwze6AN9lNlvyLAVebG5RfDuoUoSloEK0
         EhgJkm6zo/iLctEkNcTSUdM1sOccmndIGqAXBGtaIrms99ydHiJDxuVSpXeiUGux3gE4
         4dS1x0tQ6DFIvMY+5WhIcPsTYEeBNzK+2tOExpUJVKAPBlXSeA3rChcm7T2y6IjRrk2Z
         IUGg==
X-Forwarded-Encrypted: i=1; AL+hErEZJ1a045g2EjrieSU+gY/dcxqHEgETvG8xXvSUEpclx9GXQZoXsqXF5ltzbn14pF9fySkyF8AX7HNA9WQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NCpRGA21KxgL/tof3GOUhSAhQrGEvtuYUrjq7NCPob3ke8c7Y
	27GwDDpoZnheNHlbtXEpS/d12mPqJR2bfC4jp5hZMYo520ZELs/aGGuA+QQ247h+PHidmKnEt6/
	qMOL6Ae4XEqMq3PP9uIDE5F2UOFbbq+bue41tm/H/psfX1TIIkxTmU/w5S2K9SAzD2ns=
X-Gm-Gg: AZFdTZfS7hx2d2AH60z7GmSd/FIgIZeD0NEOvfC6W8zZcgBbhgeQfRC/3GgybKJ0mwW
	2W+ns7D9UjxGZS20MJcXvtn1PSxXBAsN9MPJSqDo1BDjNK7EU66UpdIfBeUh6qVC7mgcgPPEA96
	dF0+H6urKdF1EgkqR5ZCNbZKZsjGTl11gbeTRy87H7FJPNEKwMGv3Ltj0XmcaABVP+AxMKsm7I/
	8wOQV5iqRtsQMsgB5WxTCJesM3Gn9ahveEaD+w+V68xcOkSQVxW8rjfjL28bUpnhtDloSxJLiyV
	o6ACW7kJ6UFazOjHenAyj5sdrku1MfjJasv+qDJY400LNwGqSI2qJT36gj9teJfcSVFxtvEwf7x
	k+WJXygBPNP3jq0TiQRh9lEYZI0Pj/rXchEGMMvkVac6oTmzdpH7RqLeDXk+4NhyY+CO30VboN9
	qMkPgkg4tr8GMjux5DbXv+NPg=
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41583245ad.57.1795192679574;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41582965ad.57.1795192679031;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm16472455ad.76.2026.11.20.08.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:37:58 -0800 (PST)
Message-ID: <088d0be9-5d45-4454-b160-efff83e7a647@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:37:57 -0700
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
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Haipeng Lin <jimmie.lin@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
 <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX2CmVlmVdTa02
 VmEO8Vvh6fOXoi5fxV0bqPiF6slaFDRWimI0BKo2utUaS0p0sNHrtwn4iwXb3/tmFnkssWDxj2D
 VT0dVrLcMkgxIueTRdJ2AIktlhqDKf2jNlxozjTCdupVUe5zbqZveNJFNNAI389CHbLQZ6+Dgao
 w9+CW7J4eM4coPTGCGU5uyACTsG+yQGaa+yd1mmZIZ3dkeYCNiEjJfKnLlRTYAF0El4U11Lo5vR
 svuyrwr2xL8MFdjentPGGIYpbU/HcgWSTPR726bxspDQ5qi3QMa1LDGhqgCA55+Dw31y+x/z5so
 fW/xDu4l9cbJHqz8FqUSjVa9i5F6QrlXQrtxF373zY+IHFf+40jGqWIhjSEpcEdtVkgH3KRRGz/
 eI8x9viDgBXaUUXNweGQvi0DLONDmCRtHq+DhcwMwGBXAHahkI7DsONoTnMuwpEWENAmG4DQald
 smSXy9/wTuynOu1eoPw==
X-Proofpoint-GUID: GIBXSZKgipseTH0va-SlfQv1IzckwPaZ
X-Proofpoint-ORIG-GUID: GIBXSZKgipseTH0va-SlfQv1IzckwPaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfXzhxKiTQ680wN
 QFmfopLoASDI1qkAh1rgSkEq3TN5n0FhyHifd3ummX8OxDOjYRBeg/IKlbC7SwXbuZdCzU1VlBg
 G7VnC7AHr55Ex7dQzKcZFJ50j4QlGRY=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b007768 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=nOnPFlOobFz2IApT-gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200066

On 11/16/2026 8:08 PM, Haipeng Lin wrote:
> On 11/13/26 1:53 PM, Jeff Hugo wrote:
>> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>>> From: Haipeng Lin <jimmie.lin@gmail.com>
> [...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>>> This modem carries the generic subsystem ID, so select an MBIM
>>> configuration by machine compatible instead.
>> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
>>
>> Unless someone identifies a better idea, this seems reasonable given the situation.
>>
>> -Jeff
> 
> Hi Jeff,
> 
> Thank you for your reply. I tried to look for a hardware hint since we
> have to select the channel layout before opening a channel (so that
> can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
> SDX65 is non-zero (12 words) so it could potentially tell this module
> apart from a dongle, but using it would mean reading BHI before the
> controller is registered plus adding a table of hashes in the driver.
> 
> I can try the hash route if preferred. The machine match is simpler
> although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
> ed via PCIe tunneling/USB4 you mentioned...
No, I don't think that is better. The pk_hash is just what firmware 
signature the device will accept as valid, but does not directly relate 
to the capabilities of the firmware or hardware. Trying to tie this 
workaround to that feels like an abuse of the meaning of that register, 
which I would be concerned would lead to some horribly broken corner case.

Without additional data, I think you move forward with what you have but 
it is really up to Mani if he'd accept this or would like something 
different.

-Jeff
