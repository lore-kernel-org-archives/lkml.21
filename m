Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614339;
	b=1ON2RebTbOWXbFRiQy8LwGuZc2fbI1NBhiHgq5ELKcLdgucNerX4ShN/eLWzLWvXmkHH
	 2UAHG46wUgXNzDyhjua2HWRni30zrzqWITbByELn6/1qEdpZ9XFWI2N3QsEtYjjd3JCIW
	 7TLb5b2lCNPEpd3qyRhXyhs2/ZWTCL87sUwiNVeujloclwghQmdowXcckN5qgk+jUgnC3
	 P7MtN4AfOKMTbmhSHc7S/Baiw4+0m38t28eShYfFjALVBWDSGKRcLXBMb7QfhCIel6XJv
	 +c+uigzpk1j83rdob3BG7speK+226qsNtijrLhAAO6kAc6sGsP6IDTQPJxW5yEJywoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
	b=FU3mz1Em3w1b4W05MF+jm8U0HHn77723ahe69wMk5yVYrTu9tK6wzrKINVnO+1xfWBJW
	 5JDzzbsPt5LwYvmiYFX0nQXUYjqaf5jbpSmjLJ0G8k0yImYV0HeyoFiaYUo4VcakzT7WC
	 L37AJ3jqs08RB58AGi8h0My/WUvxnhnI9wTmEYsP3s2ZTUAtlQ0HNTKtX4+MBRWvupbvW
	 cjE6395O2ma5DJ0rf4KecjRIc8bsdI6dtIjcTzkPHvUj5GMBZF/XJJRrauV2CwyxLmtQc
	 4WZH9CohNQBdTzU3ZFYM0IIkUDYfXIRpMyuW8p4FyJejjCPOivMj/er5j6l847dsldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgph49aC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg5A7o1K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B4E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgph49aC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg5A7o1K
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mREk4131677
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I5CcyHsjMPR
	sGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=; b=Mgph49aCrmkJ6eDtCJLPb1VZwwq
	213BhbodPXryHdS+JDlqE5OPay/ybzN1/8q8Uk7nBVUctMWKncZqyvko2dbKnT1q
	loTgaGadTGCh3T1E1jGzm1cQZ8kg2/+HMsmg7X7dmLypkdHY6C8z5P50OkpwhuMc
	HJp1lbH0tIrMG0og9wDGbthSO3IUqjhXO9jc4KBCODXwgK0Wm7I33zXDnN3M8doP
	EbLfyMNKIKk8o4Lf1/RwwYMLFxfnbGbY6zVKKafSljQiWxk8oRGXUb8UJKAX6v9J
	7RxqjJQH4BefAAZTqsNYC9PRUMgW3fclDU474NI0HrSHnfu3IoR+Fy2cWNg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs3ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:45:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso811163eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614337; x=1796219137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=Pg5A7o1KTqAcmdhjI3cCMjkG8sdSrH9bPag9e+eXeIdkFWNKvQh4c07RdPiST7Tqbv
         pK9+1ckevDZgiKmWIi0zvY41odkQVoPVz0xA+J2L/DVQysIfaYUDLqDwQc7GqfSd86i8
         0tu0AbeGsqnPhvj1rQvIqoPBrgmuAnnThvLrTuN4Kgr34SIE+bB2mHFHm1Gsg2RXE1hO
         IENhbcDF7aQawu5Sx4l8N/iLWVuKDvF/oKIOJdb8dXZQUpXZpUfvnegSwAZtP4hLU39x
         wglJ7S0cQB4BHxrdQGAA9bbbycnqZUy0q2bIKvIBd7rQU7QzEuZNPRwK2mQBi7vrgAWp
         DRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614337; x=1796219137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=Oh65P1FHkSiNGN+N++WB3ufvZ38IMtQgu92OrpGRGTSvkpFCS140NqXJy+S2xded8a
         q4ehE5hlmfEhglOtxZ9pc4n7Xyv2ZVqUYRmYpNAEYh/MLLp98kS9yajdJ+6sfLW9NbgW
         HdYh83jr/hx+OdfqV+WvceG+vIpqfeQBgCXEM4ItpQmY7zjsPsMiAHyGWfHotbZPYm+b
         UNiHn5OSH/FYOMfEFr73cIvQuWY4rnRZ3W1KNtx49O6qHTgt7MJPgJEPDRCUrck8kZUo
         UGFYEpjzp8EzYDmOYSl9eHx7HGzZdJlQ+Fjm3ksY2H87AMpxT3Os7f87MbMlZmet1Z+F
         DocQ==
X-Forwarded-Encrypted: i=1; AL+hErGbyL7S4Xzlcmk5yDtm69L+54suIqKnGp55GigMnoz71o4y5swuuuKUwMe7GhL/njQxb5cUCaD5imXPkrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88A3Bdk3ux0brh5K3MixgOx4/YLvc6LTvhwAg/wA0cTKorhJN3
	RZc2iU94BF6GDyqPTxJG6MwexGopMN6FsW8GXZoJ3DUH+SG72SQi1DSFbmMwxvUkMhGYPRC/zxx
	JEfUyDJwsO60mzUTgMOlQVoYB29I8/gDJYJgW9Nnyy0Ofs8wCrfLu7WFKR+AbM+cHdK4=
X-Gm-Gg: AZFdTZearWKCJWERzmIO9G3cLhv5s7Uoz7Y55m0DYNu6iw/qCY9wD2fllDSYF+HUqzn
	0WuZkXxX7X7KbmwJ2p0GhKWtdMWuh6/h55+LdpzyG/aAl6L1yEP8qZTsBeoK+bISO/y5tSXrN9I
	bk+Tpi8i66S6vA9QzHANVQV3qrTNSBCxPJZXs9LRgMQvXun7t7YpPfa3p7P7jDUUw+rGIv+HSMX
	7cfN/Vw6lEI2Ymu7aFgj65XoZeBLb/PZmnozOh99b54Wnq3vndo1edfUBS/cv8kfgcleG3drNvE
	Ed/vfi8ABDf6T/NTTunrAx4w3TnX/0D4pFRVP6wMetUHmEJhkgpcSHyV4RpYOZuXDbrwfKg5J+F
	DvwG/RDgtDdjDXVJnzljd9jeyCFiLb4vO3JJMYOeihNMj0k6ZTNdhhJeuRvSJK6rnozoHUlct5A
	JbMpwgwDkfmZsUtdCoHeph1Ys/SyKB911xF7z15rcV6jAMKbucuF2ugUsaaDmHmt9Hcw==
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891263c88.1.1795614337141;
        Wed, 25 Nov 2026 05:45:37 -0800 (PST)
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891175c88.1.1795614336326;
        Wed, 25 Nov 2026 05:45:36 -0800 (PST)
Received: from hu-ninanaik-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm68870217c88.9.2026.11.25.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:45:35 -0800 (PST)
From: Ninad Naik <ninad.naik@oss.qualcomm.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/arm-smmu: Use pm_runtime in fault handlers
Date: Wed, 25 Nov 2026 19:15:27 +0530
Message-Id: <20261125134527.2427608-1-ninad.naik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
References: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e682 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zxn-vXfs4R3W1Tx4-PcA:9
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xx0jRyN3UBNRJ2V4g-I0ZlVDduYRXR32
X-Proofpoint-ORIG-GUID: xx0jRyN3UBNRJ2V4g-I0ZlVDduYRXR32
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfX5xPN6Q0JMinS
 TQzk9zH+ItYzCTlNxQkoqd8vehswMBaIEJsqM3KZAWNrrE85N69cf4FbenrbbY3yndbS6RS+XFJ
 L6TdDCSmWW4fn5H/PwM6zptPOSMwRWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfXyH1H3zqWmgFY
 aUVABBD6QUvWSfRBF8cHjMrT7AtJfWVlwYMX3bjCilgiSD7ScWjYNDj+D/swcDKUcGmgG/eSlmU
 aoU1GMcohFxwYhNMrzjFAHTKhti6zt4l9L2/BGsnWl03muszxfFSAR+7XIb/GiERQR/9y0u3988
 wS9HfOoD+vi6rxIw0kE2S/lPGS2Tv6shvOBhL0Sla/OHI2iBNLiAEGLd4CJTL8rfKCa9yaoPt7b
 kzQZcKknpLyHqAJE7P9DM/tR4rohphKI8IpLjXs1KOdHYq0xBkVQE784YmLQ7tWYUPoRHVlaBRz
 WOBUbhmZ2WjbWbibMgS54G9VN8qEim6Ox/XiEXXFNengTSBtFAouvp+AsFijNhWEgad8iWNBcX7
 OQ4r2hPZRRV86UeI0YjIdiDpKRF7cc42jz2fzALY+lH66hg5/7E9P/g/9l1043steBFx11DWQ6N
 Fy+QJQBfJxHOxuir48w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250054

On Thu, Aug 06, 2026 at 03:52:41PM +0530, Prakash Gupta wrote:
> +static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)

arm_smmu_flush_iotlb_all() needs the same treatment. It's called from
the iommu-dma flush queue timer, so arm_smmu_rpm_get() there can end up
sleeping in softirq context if the SMMU has suspended in the meantime.
With a firmware-managed power domain the resume actually blocks, and
we see an RCU stall:

  rpm_resume+0x18c/0x768
  __pm_runtime_resume+0x50/0x98
  arm_smmu_flush_iotlb_all+0x94/0x118
  fq_flush_iotlb+0x3c/0xa8
  fq_flush_timeout+0x54/0xd0
  run_timer_softirq+0x28/0x50

Skipping the flush when the SMMU isn't active should be fine, since
arm_smmu_device_reset() invalidates the TLBs on resume.

If this looks right, can you fold it in, or would you prefer a
separate patch?

Ninad
