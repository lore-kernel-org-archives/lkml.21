Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451502;
	b=QCp/B78eLrKrN0bjRRom5Z7rT3lVFjYCi9tJ2qhz0fvQStvWvymCJHvivpT411o0gVF8
	 a5+lSjUa8rka4E29Riwc2PN34zGQ9cQs2AcbdCNn8iUwVw2KpV5v6YTH+YGvMb81RD0ij
	 G8GRcJ01SxOjHnOyPm1rc3+Zxcj5gG7lsbsCdTI6+MNcQ0LFwOvCKRix2xOqpEgaS0Zwm
	 PIBWcveX00f65MFbnmaJ6iMNoe3pSxKM8HYrS7eqsfnai+x4cCVaJy6H8JDaFwZbafIvv
	 ddQp4FhL7TKibtK+aVMl7uGcVKy58qTGJL99w+ldxWe8u6toFgJlCTbYRKDQgYf1S0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
	b=NL/kGh2Eh+L/mPL22LIy7vg5fnXjSt3BYL9n0zS3+jQxr2N7aYYKwgaomKPHo+Ygq5qh
	 0W4uiE19cjvsx4IGhwD15wZE2LigZT1YhXcdpdNjYmZYp1y/qGHSKFZrMihcCa+PNqyGJ
	 4nvWlWDMOK7YURDJojPMKI+UxyRTYg+rYfW97C9EOrR9Jy5RP1nx+QiVBwJ2u2SR9a6um
	 9d0zrqDC8NDuxkHTh2mDcTAas5amlZ0bTXb+qj5VBw1cJBemEudIreG1JW1o89kyKJwCg
	 6cMgCZtRwdQu1DSaKTmAZdf+JXdjWMSCSAnRfhSg4r6Tymh+ATGYJKT4wbSDM0gNggw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eyqj0/3F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51A606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F51A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eyqj0/3F
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGomt3730237
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7NOwNcsngTEaHkJEW3GErrX3
	AAbJGPw+NpkX8JQVxf8=; b=QcKmy7MBb97K0QSzDrScF+1C6T/GrGJV835J+s91
	C3aEIhawydLZuwr+h4N6LczdTRoWzQz+uvMIzBc4v0L6FwFutC4oYF6ByQBxJ6++
	ueIbk2J2rens3k5vfWYP+lpbm2HrnFRkiqROorhLEvZyhnZHY9e/g1prrWfEESvi
	cMjR0e5miMOSPx1mk2CczH0PKj7kqkR0MFOomk+4VsGf0ff8s6tpkn0d2qn9r9jA
	E6uMUEqEPbKwHhiKoqaiZIB3pjuEXks9yNzrw+ashRqA07qZ1gX6F6mRyowGcLmR
	SgotwrH6LARog6V3X9CoGa8pWa/YEgdQl6mcKxXmkAW+aw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2d1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so3931294eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451499; x=1796056299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=Eyqj0/3FvIPMyrBKTVmQg2Hga2RoWIkPrfMJDxJ/Rj4fdLvrQQm7OLtNV4+eDTYU2i
         mP5s6izCvtG5YkqEGqv54saYqJS4a8syZp7aeVrV58X26Nf+L4b8Kd+b0G6MgWY64OhK
         phaZVhJ/PW5wt2F++4MTQkLZ7r+w3e8dwk70qCwJjijO6Yw6pQg9CKSa8GH5kUPTitjD
         yAeGDbVR0Pk/ZWkKsK2jEu0/Qw5DRoTDzitUM0VUqhwsI0QNA4vAxRCqhNUgTXSFR9n6
         YYBXe6imDVkKZeyb7wVZNtHU9HS06aZ7yo8kqKJCurSxlWgStBVukjP86JOvVsWyZFdn
         qrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451499; x=1796056299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=ReKc9Ujl7tKjJrbXI3jBcOhr8v5CEXvAmCLkz7weDUtpkfY5AahZYwQBnwwTRawNn9
         egOKdpDgeP1XMtYBNKT5X0dJ7XGBvWTM9Tw1zy+QUeb7TMJRty2DqIibRhUqyouemN50
         eBE0LlVjTzHZ5ONRdmzf/iNDLduG3gSk1rYtLeBb1jQ1qLKvPbQoaqtWkOOuimQ8xBsQ
         ox4q90eBmT3cTyNOSB0IKCtFSZ+ruN0E/aYJyX1JEFxl5f+Sd5ecez8l1v14S+8yAd78
         E3xfXn7+rY88w5yJt7eS6kEx6hhO3nVW9dxkfk/DrDDCIE6yDHoKEa+lfaWZupNPcx2c
         cmjQ==
X-Forwarded-Encrypted: i=1; AL+hErEIO3ImjuoKk7jHKojaJaCJp1y2K6VSp7++W2Ss40XIXaChOP3c+/onhy5ASld4V+6/Q+HD6miBKF3Xicg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ithd8lthgazdk5cwxp7Uda41Jm9HPiw0xGHkvfEtKmDzUUPqn
	aShQRC07goInbHv27fMgdBJ1Nuvguswq4yO/kjKL1B23TmXNIo9MFUPIEA5af6+V/BLePMNlIn0
	p601BHXTI8B5JXbh+yflDck/3yrDW2PgTlSKfeuBd7Moh1EPNyBzf0g+CtVQ0u8LgIQA=
X-Gm-Gg: AZFdTZfujgjqosIPFhpsFo/aiwzFHj6riAxY3uL4SE15TbrMTmGv5/x35Y7sxcZHXjx
	xl7kv2B55uCvNKcEyzdli38Hccn2kAyWhTYLlsOAuLXnyl0gfwTwVJKcfX2YFVHMcMsneHJV0rg
	9Td/b6fiOk1bWB0mzUSHMvwgQs7WEt4Xi9ytbwySAobnUHzJIa6Y/utWh2ggT+IxdXyFxycoL+C
	v1t40ZsaSab+rT/QnFbWwG1fBrqEmrbHHtXOWmVF3jfZ4eeEWpkW0FuguYuWTJ3fRIuzyPSlIW+
	RFO6fO7aFo9nq7Q8MLvBlni44zmFUORRFGwxSTtbGv4UScFeS+NP+yFDCFepFvTJytk6902LZx2
	veFKOb2aQtvcgMMX26BlrJXd1cTD+yVz/RQmPHFQNDhvqmzedyzY61pqimlaTUrNGfSEPBjiR3B
	pO
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557993eec.18.1795451498524;
        Mon, 23 Nov 2026 08:31:38 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557970eec.18.1795451497840;
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38685149eec.12.2026.11.23.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Date: Mon, 23 Nov 2026 22:01:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163129.64fqkb5jniwitmwi@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uY90dSmBcK0cdQBZJ3vW6B6wmfOk5av8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXw3YkCPDW5rlp
 tE6J+vroPIYDU/51gOrPJ8cfDh0NWZyC5dsltkwJfaSvzGAqhW9z9t9Ucyii0iv2DiarCMwUJ/L
 q5WBnP3YgspCkc9bC+38gAiEF9rp352NeecMF7jmfYVg7XfPdbKmfbD6P7IGRms5FmL7GTDO6ES
 5slsYV3pAboTenGglmzcKuwkeM0wUxgMMuAOfBxzPPFT9yejI8SzdXAqd+d9yGVX6DBxbLb1dGl
 RmPXxaxAMD7nkKmNpkgj3mC2zd9N8aa+s7hVNba77q/L3715UoeeU4z/sLYtjXnxupVADmzGV2U
 M/wgUisbm47PKIJ6QMNLnxOglI64cGirlrhXjEA9KtK9eVEhqgzq4u08DwDoZeiHb8F9VHnNQ4W
 nraa+HKFw4SgBQL+5zGxqo9JB0pXk3mgMOT8R1f0DTsno5ajSwZGVnwCYKmvF61rdi2KdgKwOr7
 nMDSm8JDlKU9JLvUB2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX1PZUjxFvGwkK
 Fh+PgVh0f8FXZkq3GTuI5rbWuOZj+i5ORvhKiHZ++FGK3Pp2CQlNYaPP39PQ7i2ULaW9td5Qkbs
 a6CPruDVJ1T6JwFIgdCtVj0LCoJXAD8=
X-Proofpoint-GUID: uY90dSmBcK0cdQBZJ3vW6B6wmfOk5av8
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046a6b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:57AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
