Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596990;
	b=R9CYXW4rFieEXIsjuDoGAXeq47Y0Og77j/9Y/qYVMnnsKE7gtD0p29mSlryclIcv7ZuF
	 3/erlPfqzNHOdGZ/L69cdNbnpIzO6IQ1tb2HJwrKexKIAVGTntO+++OGdKgJVUghg8TxP
	 xmhqRcPSxYPIFnMiTAeZj4OMJBCHQufaU5PWkYf/Nr6eeEIP+4qcLtmccqPczkQQ/XpoM
	 M07mo4xpFY3mx0kacEzFxkdQXoy3OiIwfVuelsFYwILIDnzrdpuQqU37EpLxIs8F3AvCe
	 jRvylyb1oIFf6w/lZ9Ah6W/yDlcqFnJ1M0xDOfM2sJrO1R/yIJcZ8pFPq4yNxSa9mGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
	b=X8FYJ9DljGUDPMYSKsgcS/S+Mnt/9b3cjEhTtE1VYE5upkucD2nsOWk0wbKonUBKH24h
	 7OkdNDAknP9elDV8vI/slbR2Oycx5Pu1w+I9Rb35LlP6i5iGqEre1IFr73W+Xltsm+QGc
	 Stu/Ly3dJ7iTISikxbINjhkXhgjX21qQclpQJTRel5pwGaeN0nbCWt99sOCUH8xC8hV9y
	 f4PV68vBNV8lMZhr6y4UAWIC1XxmIKPkhIlQTSfhxjIBF//bUTv5yqW9Q0rALmmO5W5hX
	 sw/M21nV8DneQMUJyzH1X6vzzPArMcnB06gucoGKMu2+/GMUW1/WuzORE1scQYV53QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAxXOZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CgblMO4Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A32606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAxXOZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CgblMO4Z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69uZ81006374
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=; b=APAxXOZsnkjimD/B
	RATBk1kAQcUJfGCipvlo07R+RhtVQYDT5YZwEqwwY1aJmLtzax4BengNs81DeGGF
	3fIHkwaYNGfmLaUHXuEG+cpLHRbCCt5G256QFmhvRFs2eLAYlhzD2T7kKlitg5uD
	dSdQLIYOzMZHppv3yCWL+cOw/rhqDU9/LyIyy+isfpr+iB3caFF7Rc6qY13/NWtt
	yWYEPHkXFsLWKkWvXDaKbUxZdFPABrUfGy2PlZg78rM+EpDQf9FvXa0lLPsljHnC
	sFdXKlCIveKIuCheQoNpf8roPSb8laEA6LQ+/I3MsCWHcBYezCnMHhDjXzHir9NW
	w/Tzxw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29aty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0329e57eeso52134725ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596987; x=1796201787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=CgblMO4ZxhU3G1q5gG+uPxXiJufmuYOwDr3MH802BHemvHWGl3uQDmwGiHuwD2HeA4
         A/Py/A5T9O2gxPR0Ljj1f9USL8jFRxbrMUU38rYpkYqiotPj/x+sUyJz7m0sRxyNwjuk
         NReFpCs4KB/5Nf0icuC9ncvDXP1BzXwNFeF4y7G52Sv5Uw6O+a1wBnu45rSrYJGDnFKP
         Y3qGFDlFKaFVkxahhDAh/8Ll3fRgdo0n1AtD+nRxHmNoBdG9XwUMUphMuk2ADVaLs1YK
         jOv1jDGPxQNOX6cClxwl8Tdz5tEfh7DWZCna360UOZ+W58jkaMu+oSIzjdpcSS+WWGoT
         cbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596987; x=1796201787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=wot/+SMVMyFWYtlzPyWcN7GMoSSkDYw0VsfHCgfOOe4TvmbFJLVh+4MfBmfKd9Rv8O
         eOru0aD9M381xjCXKmz4x8rdHxHaxIHYx9WAqHK2UHwGdH/ROzryLbcCW8Jo2eDJt2Jv
         pBOgsCb8YZ3RCu5wT2V9+K3xA09f8MouFX0Foenk2ZJxFEwgF0n2cf+scXO8hzPHFaJ4
         2dWsszNA5w9+NkcSdr6MeIIjk5CdpSA/DXip7QHkEFPV1smo+W2eJb6G+IqyTLN+SEQX
         sVLXkwdC8/VecLdUxnckA06XMHd1FhvBnieBQowOq0XuCCTqJnYzOR3NZEGQbQHbCQMy
         2IDw==
X-Forwarded-Encrypted: i=1; AL+hErGKgm2XF/9n6IP+IQI1u+Z37fxh6HpUrUUt4olO95zId/OB2JFnj827G7+monwE/06SV5H9oWOkXx5M2ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ysCD/KQHaVXvoN97clqJJdhK/1k5+OmDzaCmmlIwLJoHTkz82
	yoo925tFej+WoksVaqPgwWJvPdTKwOHd1NX8279xMZ+A93bmZXGlmhvThhLZvG9Tb54+CFAMae/
	bMt7zn50ETmS7SF6VkCNMCYkyFKReL102pR0UV7LRhVpJ7ytEU7jZFyqvuJmLROgJjQY=
X-Gm-Gg: AZFdTZcHuAOjyH0xbKPeoB4P1bwlkBQsGU96/qroRQ1VGtN5FWLtd4ojTGtbfvHPIyX
	03H2K54dD8ro2ZFNymTVWjxvE5cqQbjBJDDOeZYIVAbPQSB7TqBRnFnpd8ZQCB8IRrBiu8tevcl
	eYmn7GZjNGwEonj4OURiDciMwDNNcxXW5sTCQ8lSnVBEH93qaStt21q21sHXLllc+hztSkF+tz0
	8epq8DlD7EwNYMhkyovgj0pvLx5xyzzAh8pwNgtDC0WdK1JeWeXdScZqpPUxQakNV0Rrlo1p9sI
	yAMKoCK/sMFwPwWmnAjzK3gXEcbF/1xHaltyklX4nYBuEq/G8l0jK5iNTTxDvBfwBRWqB10t99Y
	68r+fUR4U0iQnTZdTCwh9Son8IX51YGHs1Jv8BCEhDNd3Bcy+2+VcDtJbznjTgfB3ds8GH5LbDO
	Wsezultsfng/7UCPZi+A==
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856171a91.43.1795596987427;
        Wed, 25 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856128a91.43.1795596986940;
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Received: from [10.152.204.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm10551052a91.5.2026.11.25.00.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:26:20 +0530
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
Cc: karthikeyan.periyasamy@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UggamiXRisDFRUOdfbOqJD4D2DnT0SOY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX67GV0tA7Z9Bm
 BcEAmO33sQmFNw2QLEleDECb4Wujc0zY3V0GHYB3k7LcXfDnEksuXIqdAH4ySAe5wNU+kezZeLW
 XtI6UUkaf85s7oHX3rxaaPjr6jgJjWs=
X-Proofpoint-GUID: UggamiXRisDFRUOdfbOqJD4D2DnT0SOY
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06a2bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=X1FsCwAd24jH_VNFHjUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX9h8vOBcnRaxy
 UAZ8qrbQnqcjTPt2TTCmHzqY/Sl2qHdPkK/YBUtja5/gIyozRLP6A4nXWxfVwNtQ7s+C+TOK0rn
 xp9ew60QBVzH7Vlf2fbnDPTwk99+CrgSPihgl8gdZTY4UepBkzGe0naE1ix6YiRJQ+qszOQ5djl
 08nP3kxeMVtCaVXN1VRHOTn4hRsCcQvuSmnzLwe9dVLtQFHx3Ge+biE9WluRMbRoxVVViWgAx5t
 vkYuiDGYzFAiN1flDdEt9/CKL12fAvn8YbPCGGYmz6I57qzL2/LKzNXArjEPt8GgFBzgm4eA7QK
 LyMathtoZzmdbuoR3EH8J/Agx1cXdG+SwFL7UfQXuFd4LYYC2W3741Qkf9mX8Hn6HNGzkodxR/3
 hHKuKmYCt8VOqC3USOpr7ROT0DXVBN03lM6mpX/D/4fBWVy4YvAKUDEMDjuok8BuH/Jwel6uH/8
 jvK8iXki2GuAq9YwT5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035



On 11/23/2026 2:38 AM, Julius Bairaktaris wrote:
> With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
> source the hardware took from the frame, which for an A-MSDU subframe
> is whatever its subframe header carries, and mac80211's 802.3 receive
> path takes it as the station's address. When mac80211 deaggregates an
> A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
> is not the station on an access point; the decap path has no such
> check.
> 
> Drop such an MSDU on an AP for a station that does not use four
> addresses, as ath11k does. The address compared with is that of the
> ieee80211_sta, which for a multi-link station is its MLD address, the
> one mac80211 compares with too. A four-address MPDU from such a station
> passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
> frame, from which mac80211 reports the station for dynamic WDS.
> 

Can you explain the test scenario ?
How the user trigger this issue ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

