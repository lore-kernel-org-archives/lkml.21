Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462858;
	b=bautKK683hz+5O2AA7zsVWuk8bviWTcdHtSvQhPxCffZew26fr3m9gDWe0o0lU9f9ndP
	 E3vxEF0YOUfAxlCDBGhtBaJdWZCP7kTwTAwSPAxitao6NJBOH9t0a8wQ9WqcKuAEmiJkN
	 UPTI+590TW/dwb5Q8wSr0EOR9Ch0PG5mRDx0r6e9fiSp2v0Yjo3/srE1RMmP7xtWUat2+
	 qYrPklTo93fh5GnTF866F3yjiigYq6h5MWbXfuWaLc6ecXfaEpB//dPH02OEgSFQtPLHp
	 C2inNQERUFK+FirkS9SvbOTqhLwdBr4vbTFqJIa84JlYzu2jgkFsWGk8mxahhWNpg3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
	b=YM996h/JDSmbzRSg+SLAuEFUgl1S87QbKPLCx0Uzib2lM3Wx3KOpIz+0LIw/Rz7cpA3k
	 6rXT9mxr8TvVzcA0G3LwpylzGRIN1lZpy9SFXO8hGl1QRNiYdXFsWNThlZqBidA7vKnCL
	 RWNntnFbBsSg30+QaGwAFCWb5Wws/MwhWf+1EZ+osUZbLL9BTb1SZWItMVec6C936LmCE
	 7RKzhG71wDVqUaJn5NGnYdyx1mejSr8su/TIROnTLv0lzqXGlTbmCmjtSpCGbKCO8/gM5
	 SNY8u+x8qhC5AT9eoBuGnUxmPayrKjHxYT8hDC7wKZfrFtIyDmEc36Z69UoA85Q3WXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bn/+2yNK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXw7mk5P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBF8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bn/+2yNK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXw7mk5P
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNxXq3441386
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=shYVcCkI7WsAel14qoPcI2k2
	hO7EaXLkaVqcGNDiH2M=; b=Bn/+2yNKAWCbEFLfimFQervj6gTXuixll8020nAT
	iotFPwlivvF47lcIPwxH/WlQ+Z08mMI/Z6+PoUKgv/dh6U+T/Ee+dd9bYCPmCfR7
	kKfncRVAAaMkzYYe5xUW5UkbJ3fyuvZj8QsyEzZPW9lG7yOvhFq5tP69wgj5UvYw
	wpMhAiscc2j8PSZXoIVLpjE402kbi2lpAjYUHHvRaeO0bMWGH6bfCD1/X3G/dD9R
	r5NuxTqh+KH2xuY9jyWJvh1Clh9FQGtf4OEKaSLi6v4JEQ04uxTPX8h0YxxlVe+V
	oPCtpFZHnBp0AR69T1p7QzlVSavOI1V39/uqhLuWxHUQrQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr82aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920f97bcad4so68868446d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462856; x=1796067656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=IXw7mk5PRNQHqwCrFvHpfFhu8QaVoR2iAfajyoFAG16wZBjFfilZq/fTseNxaeRuv7
         EVVp6bctaasp0UOBCYfj+NmwwPvofiFeS3lCbDtAuU0TTMzS6t1yHgbWaE4HybiKKTC9
         os4E1w7amL0RL8sQP8Fu6bv007yM34WuOsyYhfQ5vu/O9ON1LL/TCDJJVKnCizTh8sK+
         kaZ/iqdY5PLEVT2uo8F5Hzq+3+U/LrlfjYGUrZqTptxRtDlKBwtUsgywnN7zvbBAHsh4
         KZrMqjrHyBDsTQINQtWwXjvbYK7wc0hDwBRHP3s95l0VZYuUBnwWJGnsme2gr7eNuZr0
         SGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462856; x=1796067656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=fzkTZlo2j1gQpwlhRN1DbDk/8MEn3imxRJR+XN+flHf7wIUu5i3Jg34OkRWLAqKqpP
         oqgwN9nhhh2RqY9Iv79byG+HwLFRn12iEfTXU9X54HtecBHHa6Xb8PcnMuLV21hGMeDE
         qc22W5FnzXtFc13EeeUL9rw0KDsObRQx3jSVN4dkdAlF8ZPoB10iI2CQUvPW67Bmsd0k
         uxfh8LWIgfPckA5RzjMe2PikoO7DfhqIX30bI0dkbviiqr9RyGRhs0cbL+sZ0+Cvi4Tl
         12ZkQQTvz+Adcofx3QWzd3B5LbUYIM5SXlV7hZeyZGPy8imHPqVSOoaKyGNXOlV6AXX1
         Vj2w==
X-Forwarded-Encrypted: i=1; AL+hErFU8VwRDm2GmmDobwzSdrBNyERMqXhFnn9rfiEryG7BEpel31f9YHiSUixV2EKFjBAcJgvbOnjt7WXkjG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xerYB7mPayo3rHWzlB6E7Wn7IkNBVMdXFYgE6M4sSnmTy9eha
	TT+dW++5zPO2WRIO4pyrUQI5GV4qX0c4sTYSRRJOZxSXdwOTc6XPTCK22ez3vOwYyDfS7wm8cu6
	Xte1hkDxmMjyyKfqkzn5edqiEYYaGLdr+obE5a9j6sQlSo/0oyfkgBsdEy68Ilx5Ov6jorNq8OK
	Q=
X-Gm-Gg: AZFdTZflbDAkc0J+oHdJiHhw5Nmzy6MSGAaY7v1JC67c0OpLKc0dwJpjyMEJEH8atSp
	98ZzA66it4HT2NfZEwrPlsx/EjnzXxctkfacfZNVvWLbwPf0uHJGHxkd5EytUxLIcSdq9npskEZ
	kF/KQwO0RIV4UTyV01shUJJFU75eznRRZf0Q9xenXKUhu1XM65Ke28rPFdyYXLeZPnsvYUOn8Vd
	PNhKCexWJyw/37XZbMcXlw3MVPd4AePyTVZOxZw+o2PC5gm6GCLqzx1f06K2qNJdXZt0F4blMwL
	8xQUrzU19/mPfA19+MU34cy05r+yLsCHLPzt2qyrYI7OUs0yTge3uisrue27EjsP4dhBcB9UIBw
	B7bKc7cXU22niCORYHn5qruc9gSmF7b8/rsSeQGG7dsj165OA0YxgvUNwEromhPih
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179923885a.54.1795462856144;
        Mon, 23 Nov 2026 11:40:56 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179917785a.54.1795462855516;
        Mon, 23 Nov 2026 11:40:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm511746015e9.13.2026.11.23.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:54 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:53 +0200
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <cdf3mpbifvj56nbr54w3yc4ddshsgbbecfox2vp7vsp3bv2v6v@kjedaxblfiou>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX60gmJxoGFPx2
 TKv5/9hCZDnoRkVAmQGNcvotcCoCd8yeWJfkV0GH7Dh0PLDDLVqPxLTmMMTi+DKl0lNRwBeIx6f
 CMq3/BP2DCEScui9gZIu6qwRloJpS7o=
X-Proofpoint-ORIG-GUID: dKcYpMIcaBoQne9_h8OjOQlW0q0lIkAj
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0496c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4pa9Bk6lOGSh
 CVd/aCQIhrhrxGs1SnQktxcPdURyNiMrRU4tMFxV6o98t/gJqWLIA0wRKZ+gnXBGSUGkmvIuLSH
 fRONbP0GOzg4bXACYLa/eiLVfyczZA3ZV7U0bgumAamzm3czkt1QV2J28H28CI361dVBxxPIIuG
 IeciKGE7EWSklkxCo4Uwcs3E7GNe8hee8FhBQ6NhWYOtFEkdLlYLGn1EPQV7Kt2q7ZXAcyC7EXM
 AZZUpt6noVc6qtfvvNxSlXjjap5Uu51vT0KkPfqOmdsBYJ2QvGSbCej90pTCFknKfpNF8fP8Vwq
 Q/9uiWK5gzNWhJ5SyktT+35S0rb75ZPh1j2zjZyhO9H9h/WsSrr1Fvrtt3aXrs9A8XvRoYvSwge
 1vnIgLy0gOCv2tlwjxm6cylEkkrdlZXblClcIXRIyFT592gwQdtczp2p/8k0eYUp+is8Mfmk/2A
 x1uE1CcU6hJUTh9o2XQ==
X-Proofpoint-GUID: dKcYpMIcaBoQne9_h8OjOQlW0q0lIkAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:42, Bibek Kumar Patro wrote:
> On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
