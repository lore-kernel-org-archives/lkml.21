Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462699;
	b=sGTd62EVCbgcpJ3o5hdSk3vopd8gn3M+4B8HM0H8nl8xRdxvkTCSHL8kD9dwoNqSuj25
	 DzVRmvdy9gOKBqnIJ25GGYq+kSDDmZ0O1aUQ9Hys5ovDdl6vXTPOzEuTPRKucO78C+5Fs
	 jCKMu6ekUMZ1rmdgYFHcVnJxPrA2WUoXyXV56DPM5N4gMBiWoQkQY5Go4dTmBsfJxI6Jg
	 ZpLXT6RjCfAtqnCJThimE45Yhw44XVNo2VEKxnfihdeLN0rfLNxdSghTZVAzOxGXhqAEZ
	 AN5ejVUUOjihEDtQPYF+ahDrvYajL1Z4UAP6G0skm4KbXi2MX3IfS2W6A0qhW4yVRUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
	b=nTjBiRNiu40bBYQ7Oinm6FttJExfJ4jMU/97joySho5kcB4Uow1sNjlY+W27UoMMOlQz
	 YKki/8rVKqb2uQP2JBtMPV7FgF9SInrKLIjQ6lORaWb5jjMny4Ij5hVOgEwWv0AkVaLEE
	 sb3Vc5ptCKs62f1wMjMfl1ne1G48W0dHHDd1CcPBJCIpuZZf5nDpPLvb25O8UKxgWiehr
	 K+Ep6b/HOewWnkqWK3g6ZNybvc4JNfSdR3tPBdrlvoITjDB55BltWP/iuGZKBP/91rlb8
	 sPjXajc1V6dzNy7oB3MTGklMaK9rCf04LA796JHouuJZhgxo6xGaEEnBmTjiCK4Kf3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaT6D2F6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRHHFNwe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA9606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BA9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaT6D2F6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRHHFNwe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGquD846511
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mMQUGbXJMaa86ZgCyPHuQDcN
	hrKapcPCs2WtP/7YI/A=; b=ZaT6D2F61c3tpeFzP1M0/Q0nDKwT+BVfrEyV3B5F
	1j0oxcpR889WG9WT0HCSPPyS2ur7dkrCRaVUW69pD9HmcMBGD7N6dJ6zErYcnVUJ
	t6RI/rXE0bJ9XX3fzGxAUypVTVjnVNVWHtlubj2KpWWdKC0EOGjvKEJtFvQ9YM8s
	6kLRQInrOO+of9zzfr6tsdJktDrmAQ+mAP8JhWPC/gsi/fAegyZ9degluqiU/J5m
	raupWZP6uPhkciD/8WF27njC4+VUfc81VImaGvkLi3ohj3tbVCk/lkne8AH1FQaB
	b0x2P/XA3VHj8hR/wyauyTPno4FwQLlg8XpPo1OFxImB5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7435q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso539275885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462697; x=1796067497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=SRHHFNweXCLyF8TQh2fUKuCQCNArrakg1mSt4XM60F6ZLtAEk9Ci7v1o8QBmP+emuz
         I0QzjM0QezEB+7ytuVEir52u/YI54dBfNWzB595CNliWHJiWXw26/jdkRgz3TODrWXLJ
         uvT46HaFDzToOvqROVtzQiJ5MNbK7euDm2WXSzludoStRsVqyrnjrkpcx9LKbh0qVIyj
         9M4w1bbC9FYLiq2e3wh0GCuXh8NeWplsKBUTHfdnbScKNzykw/N1+TYUmswl6SZ5YW9M
         7taVHHD/lxrjffeirbqK3wK45A2OqlfoQ98BUZezO85i0RVh35Wrnvq6LBGAg/QxqzV5
         H0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462697; x=1796067497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=QUWzfhAlgoXosYf92RvqWXXl2jw2mpfyVIP2M0V0NbR34noXA3jpjMsGfMQiGRcKe7
         7y03zyHugN9Rl4uG4mqM7gS0bmDDtipIJ5yCPDa41BPQgNMJl7C7SxLFm0AkLEYgPjUI
         aqlPAPeAkYUPg6dPElrchYV/KMYnO3qouEWBD5dlZ6yIn2CkE22RJ1jya1Pv+1YwtmFF
         4TzbrvQmKfUQUHMSL0mMc+l8Knx7MgoE6UwRW6RLUEatSoZMDjFULXYzCTtcbS2rbn0f
         MZDMdlYSa67l9QiaN1vlmHij8azKyLSrao1jvMYL3RNbTGgxyXO0PXaqWcrk55ZCnXy1
         aRbw==
X-Forwarded-Encrypted: i=1; AL+hErFG2tdkof5Eyqcuby2dFsJJDZ7GELBkaf0zt6aCyudISCdlXO6SRU1fy2c/qgengfLSBdscwXKx+2nvd0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hJhDbdoCotjlkO4nzTqTpAfuM4FOHugy+TGRN58dnav2e2OWD
	nEz519wQxEulcGyj7C43HGReCRTxxKZMLukMeCElxXzC8vuwI/NWJU2SU9f2zsw2nGyeFkN7xMA
	eIgsNwrqar5ST6CBgVxIovhciu4Ynw8HIlAylYMNNSmLhl3MhgV71UDS33qKZ0eBSyKk=
X-Gm-Gg: AZFdTZfrjXF8EjLdadLoTzw/C7yDCDDdmXOFRVRHLag2YaU646Ua8pRhsuhy7qGOyxW
	8OWx6eP4GE4AfBvnPJTT3H3+v2VV5KgcNfLqjPFy55RvY4GoTbCy9qrJ56IBh3mLRs7Ur5nZoRD
	diI8+TRDotgtFfB6PgRIBekykhKsI70ZB+Jm+PDPud9HknSZe/nYyduj2z1lVWkCzhM94L2PRMp
	4n0NoavrKknj9RKNXSAnS0EK6ZULu5eV37cmxRs38D2OJNRY/76erg+5JToVjR7cd803sHJou9Z
	y4xRMnotegsQHaJjNQDOKEH5AZ2lsYbc8czcwVBx6qLVL2i7km7FtF0L2krjFmwYq2kxPgAFXli
	sFZmoJceNlLoOEkFiGHMxvfntwCgSGDKNdpD79uQyK5vQ/0rheFavn7jzZ5mDS/cc
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390115685a.44.1795462696996;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390107885a.44.1795462696430;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm27067764f8f.24.2026.11.23.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ovctaahjwayrio7glzjdtdveo6si6ldiddunokpho6w5ipxrve@ef254zb3n6tx>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: Kdsltdzglev85JbnQAITAiGgEAgBkz6w
X-Proofpoint-ORIG-GUID: Kdsltdzglev85JbnQAITAiGgEAgBkz6w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/oOlXgmtYeEo
 xtR9cuKX7HCPZ3q3a9WENj581lR3k7bShsHbdxt54C4g+pXzJh7024NkWa0EM4ZcWlulz3rYeQv
 SPKdv/zTtT10/AwIEUUbbUkbmX6j4Tw=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049629 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ukIheBjJDxOVZQT4PtwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+5R7BJVsJkgr
 x+bzNw6vHx4mSxUnWG3v3HrFq7yQzShpZ7Vlh6OktwBXttTkgwQMFlG6UG3rWW8ieeQU6u9xeHu
 AQn8I4R1WWp5rH5cYKOoGnunyHkD/c2ebIePZUcogT1D1KzmaS14CglCfSbCmpLQvAzbUcUX21o
 ysUSlUQkcIucqE+dAgNX4U4E4yubsagSKbrVLirM4QUxXglaodIFvLmAlAZIEGoFNholS6iVQZ7
 n8NqhmnqhVwlX3uvV8JUIuP/gm/zVH86x36DE8vYZSTpvBxZpK25AWq3hwBQmi3JeiBHbNCGTag
 sRpd7DEk5BvwwXEYyHdjWI1/PmrWGnv95t8EqR1DPQ6IpfeYM7C16R8lO5cv40sNEkKqeDqAgQA
 EPl13zdHra3NUvWjQWvbPRqmaHUR41UtUjiuolwcnNojpzwF4wrQ/ISEhl2bwEPCMLE5TLJw5Vl
 iAc5YjioCG0tp8Dawvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:34, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
