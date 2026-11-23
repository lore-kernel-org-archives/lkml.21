Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461531;
	b=XV4IfE8szQSepsh2ACagD1a6JuKUv3xMzbCm0/ILQobPyOotHKEtVBi9Gtb0ebah3yhM
	 Y10ph5gFsADqmRP3OjJ5bEEzxjeeqV20ggj1O9MwQgmNwVEuSdX4Rs2ZcbR/2HYeXs1QC
	 bez2e35agMOCfzySpgDtH68NZs/lTW6BnPIT+H+XUIq6rfInhFHIp/+mZjUUO47/c8s1s
	 IhwUOGV3mSP/B+JRXciMOm33prHrw1rS05ip0kcWQdpFsPAnjgZYhQXh6S8CU6YKwdBnX
	 d99JN6ir8Bs1wpDoZgOVEKRe66ijU31BDh5kCjRcih2/dmS3ZxXwY0jpK7bBOtyplXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
	b=xMKkIy83RuGPU+dNtBocBy9QeQt2OGz8MKkrzxtYVls/rs/o/ER4NzkluuAmix7A1VRW
	 GX0UzG6c4pDlvRTXQCh6h//bKvVkgEEuCNw2z5XVIFpqDIep629iaLkeK+v7ToP1f/i0s
	 TEbjyd6gOAM4xz3ZZoR6Xn/JF1EzLbKEuj/nu0R+f7r2J8eGxAGbhFyNHHX8SeMosA+6O
	 7W/IeNdt9w/eWZcuRHsi1YJ3NLVM6BOiCNnDLzhhfuQSNNeeQL2fUIPfNxVNUYgUeazcA
	 DH+GwMyGevvewOJnKbn4xhX66oAOMY1HYWg2gVKMRx4eVKHw8ZHixzhIdauAt/FZq7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49441606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49441606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxOp2377202
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y805Ldq0zOs7VHrpsV5yAaD6
	RgPx1BBPdzqAj6Loazc=; b=Uzw1GTOvs71GjbbnZoQOslKHhOfzZgdwsQk7+dRY
	d8jYEw/EYA9+lqVBIXAIFxRIzyf5Yy/mfZGJe0CZVZ8Xv2Z2JKkYT9IXxaDPE/ER
	hWdV00C+bYN++LgxazNM1aBbiAyolUj/uEKcyDXN0vqzUx+vv0zhXsA4Fyp7OHfH
	3mrdFTBRVG/70UVForVLuCiNzbjQKOz5tmWtCbhh0ItuMKMhabtOIZlXLCXi3elO
	vN/KJ8htE0i1q56G2gph3oJit+LIqBLiJ1/9fs3SuuHocF0nWacg2kQU6p65Px1N
	/MDkQo2gVK6YnU05PTG7xL6ezz6lRfrrJDGoyt/gSBMSYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut1nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92135a58c91so87299646d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461528; x=1796066328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=SxTBbLJBGFViykrJ8MrtAkKFQNyJwUXCO+rMKjQeuGjhLYs1+TlsRnBX1UvXLCm58n
         /fOqRxAS36ZYr3OJGWds7mWPQb19gKrnHrkh3j9t4lId3h+/KGIQgf5bAgKV2vsg3QeB
         OtJHmzR9tPbNIqppQo38M2GchJxjWnAdlhYgSsHg+Lk11y2TjrOmz0nwB1t+MDzpsEUZ
         ADJ8B1nWC1MkGSIpV6HfmMv9rQaDJCVjnrf9tBByeNPGY2ybGkWVjzm6Tw+YmyLGbcff
         6DiV1zIgkdyTdtp/7sKbeeZln7EOcerxeVyVvbZcN4ucVQhKrVJOoCMR66dpb//kvCoc
         vb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461528; x=1796066328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=HpGcf39rzjCaISpBmao7fFUblOJHWC+H3MD7HDwyy15rJvxkO+gaue0U+bQVnyeKk3
         ObUkcY/P7VVXrHIHRvwxvLsoV1xc0e6R5HMRPHPGx0fKHnSSpTqhL0+nJIR8Qk5zRBWv
         vcUJrn3sjlYle0SnOzflLSJuyEW0aqIgjxf6MlCnGuj6PgCVDvhYIxuezPCHvIOoTXXo
         dbq3t3PH7qA0Ky8hlSv0suQi9aOJHjtg/dYFP/aBhpSoBiC/IEJAi0xoA10bD79Jy8NI
         4h/TZjn7ueTwIu4ekhIU06Ia/mgCgIAaBcZf9Eck6A9sMZd5CRpEYepx5Ja85uuiNMUT
         CWbA==
X-Forwarded-Encrypted: i=1; AL+hErFaWT2IomvSn9A9NW2bzRCmkSkKgtlvn0QFWVfziq0YxAuwpAtpdkEGYeZjVjhykVyVxl0m2Fcay36mDhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KTASmow0Tu5x0Hur2meonBo+cSuyQe3n2YJV4u5EepMHYwvPG
	ks8p+8ezJdgOb0LEyvPoOaT9T99d7moB3DlMnkjpKoCeACq486uCS6lwHbqeVYOylkVyn8R2UgZ
	MAgD4F8R1ATPP7GEG+FIicrpDsNamAIxArjM9RXn1H5nRcebwoyEvHJQu+Dppzcj4TDE=
X-Gm-Gg: AZFdTZdrRy/G7tB8Pb/MD6YDDpQlwZP3oYlZid1/0sSE/Fn9WFkTTQKHb7Kaku8B+uw
	aGvY9UtnoIbqfRtnhGtnDp3+UvSue8Apm7R4tJ4xgzxoLpW2MMUreei9TKBDpJGvaZR8xjdX8KG
	UvI444ZImpoNty22rpCUWgvM8ax18DP8Pb5ejFdvmsEPuHCFCI0v9b5tWcMzsDz8NIspkM0Twak
	XIQTiGIhjDF6c0XHQiCFw0e6YNY2xuKmLBxVKDOcRyUzBmrFiW4u5SD0YrdD9I+qZLbIi6Zbgv9
	CQbsH/hVaZDDyc0iWJsgAe1JOkBI1H/STjeKlkEx07ZaMWEd/0gl6unN4S1uGKxmyIpdDbKGI/S
	WBaQit4296p+3dU43DxmpeixhQYbGwttFUWWzvVM1Klxt/Yt2l00N99zZV5go48HG
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228551285a.40.1795461528442;
        Mon, 23 Nov 2026 11:18:48 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228543685a.40.1795461527751;
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm144885285e9.0.2026.11.23.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Date: Mon, 23 Nov 2026 21:18:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Message-ID: <qdf5ekjjakcfjc7cpaz7zrsn3a6krlkktsygr4lvsunmrxyku4@cjbey6jruzhr>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-2-hikmahgumelar@gmail.com>
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
In-Reply-To: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Proofpoint-ORIG-GUID: _sGrS82rlSKRGWv9G9OGBfOPJ5XCzXrQ
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049199 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ET__IwHBT81aRugf-_kA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: _sGrS82rlSKRGWv9G9OGBfOPJ5XCzXrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX2aiHPEm3Y/k5
 4RVY/O0uneaxA0m704UCp8lIXjn8u4oHmFoid99YdXQPa82so6Gd68WUXqlNFIuBeKC9QhYP9lu
 sd2wpmpaLVusOf/P4uGPs4q1j4T9Mjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX9RIOkqaj5Vst
 fmkPfudElK3kTunsn0/tnO+dqX2kYoQS5n+/nmg+qkyqzN7WMism89sZ15bXSOQ6EbJ2ncFtFj4
 6XswTzAdYbUNN+w4n0jXCu8oJm6OePsdWnm0NrGGaSWtwqJv0qFFZlR/I9p1KYObs3yBmNeHYZS
 jyLkOvPbHw/aem18BEB5ZRzLRLyZNiuoDSdeFnoPbtJMqL91R/aDlsBPasyhMEUec4D3KYRdDrY
 bRjtnJyOUOPP9wa+S0SACA6hQIqosrV57U3hGRpdPpu10M93msCdTEe9HIKQynYZaL0I1/UbbVl
 DR6+axMVKD9Qfs3Wu3NvVKyjK6yAUQXAFze4sDv1bIPRs05SKBA4ejBRwAkIY4DdosacdvpK4Q7
 d8e3JGPnh9RxBYuf62nYIyjePkVfKBg2d1jyGN7yutT/8jFrrOe6C1GE4yJnyeK5r4y89uBIGb5
 hVyd2wPvHCBkF8w2L/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 22:27:16, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

Please read through this before sending other patches:

https://docs.kernel.org/process/submitting-patches.html
