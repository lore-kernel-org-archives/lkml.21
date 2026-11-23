Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447940;
	b=X/cFsWrAhMuaqYyGRoWoJXK8D1NfP+APA9lt1HjQq/k/9AIYmJ1g9L7aesSIpyZ4Z8Sr
	 J11AaHI2xFL/hTm4RJ4rbdLu+0D7iQ6C4aiiW//XnCjXqcyl47x2JCCl4AhgvFQu4/OqZ
	 3h2fYKIatniOtXrU46B+2mK/FpiGskTvJtheaRUlvIXza8ZsRf+MR7xdcBa8rKBd705OD
	 7iBljYi/1wPyULx7QliFKzbz1yGIjO3JIJohxsrRfnYkb3US2v7M6Mxc/xh++cB2wOrB4
	 vOKk8ZKdau3u8GecaOZ4MJ2HDlvn37p28I5BStNRKWnyh1CG2Ia/D08Wdi7p+JcTiQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
	b=WJXt/u+EcdmAAdmNBAatcTlldADrNzf4tuUmyLzjlxadMCqKW8do4/KPyLcc40gIMLiU
	 So58QDcqlPdsmJcAp1Og28wjTjtjk9hFm3K4gXx5AVGfj+UWgnDfGbzJL9NkGl+qO4yPB
	 hFjvuCpr1QtZZvvUpg6Rk336wh8Ey4deqT9H1S/P4HnE/txbvdGgbcu7iEWi/wQ8SLjdy
	 3taOHWHtF7RABsP+qtAV167hr7ohBB3vz/HSj6XrStbZyk2JBabW71MxKUJoym3QXcneL
	 QDw5acmhuSH3ZS8u0EEkfPdwP6OJNV/jMOFrE8RAPluFe88XmssoDMYoO36++NIaUAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3850F606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3850F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwJc693985
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=XNi3fIG8bLeWMU+f
	PwdUtzFy62pJN3m/uGsa6NfdR7ouMm5LiYtfaTNBKNdEfLs2s6R1cStk/RtofF4x
	SxsjBrl8EMJQUyf9IbdVp1Kkf3Ov/9iMVU+qYILRHQ80s/FTqKbeAsCdcCIifPYm
	qQguOivaL4NEWgFe/ZZDj9CPwEVNJVVlZIKbYGV5HOdLSWGOnNn4ayu09OWHKM5A
	pLK2Rue2VTs11R8os2eWmHiavQxvSD1MSHOLPNMkcUdndOq3w/AVWm/RhpR3RtwE
	1hpChhkUrek4n3LkgToNrUj3GFMofKy2/YGBck3DD8J/sT2qDTMkRM36+YjhmM+J
	t2o3Vg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0s0v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3847a8f4e77so461349eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447939; x=1796052739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=MTYpjMD2QQBERPaZLcFvcdi3HK+YRFTwD9VXKk/QbPGtMqSoqvh9xHYlFJw9y+SYgD
         +eIr+FTPq9bnLRWRc6pV6F31+MBgbxhw/abckQ1JNU7oQPCaDfD/8McVVN55NXs7U+aX
         NZdNCZo0kobdV2WtjPMtE3HpBVwr9c3C0IbKXCIW4XVd8spmxk/f1Sh1egVhReB287Cj
         eXBQ8usEWhZ0Ic3avurBUPlt3g87pBe0pImO445Hp4gGCMlD+d7ifyH9sHxNSGx43SvK
         bsHxZkcoUURDDoG/Po/jZixHSThhYGzDc6MRKLBP3eTkFiCrnMXds0Uc83HM3ojtOHA6
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447939; x=1796052739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=lrD3LZByBYeikZ+ekRF8hxCiW/wDQ+jYdpeAUJyENVIHsq+gnmar70fUnR52n+2ulA
         Wx4zXj6ezbmrn6ZMgsjYKNHhNARgDr9pI2ZOkogtox+SHcGCZ1BujrFK2TthtRJbyZ3V
         z7we1WM4YYoiOII1Wr//ScpdwcHwo79e4fpHWe4QlWzVNRXzX2tFv3QkuMKsNsNbLSLU
         QxxBAwx/S+ncFJz5Q4fTLrsFw3ywYaC0eOHQdsGS91PTAyOOSk0cs3vwnAQbg1Gfi5Ou
         GPrvjyWDGsB2gXPzJdv0V3U5vVHi6ca9PQBCo7+aPgN4oVSgjc9w7rgjE5ztEbkZPeCH
         zi8Q==
X-Forwarded-Encrypted: i=1; AL+hErEwm2GgXA3pjMPC8QIIF5LGCX0NshGf3UaZpbIJ09rTV9tpYcc3m5cv2FqvgVLND/1REPKZcwu9arh0jJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5u+vQt9knFo3ktqqgaTltUC+HhqpGzTzvrXRp5CCc42JHTJav
	kXW2EapmdpdGmcGjQFJTf1RMJQVOb7OAFja0Kv1XJoHl+QuYEaQ3fi2thOz7FGVejHRPrU4dzjD
	9xcUhXxcepkmshUz72XDPKg+EYM+H2saGcYBvO2BfMbevxG5TF7btieXkJvFG2EfjVzk=
X-Gm-Gg: AZFdTZeTxgdXi7hYq3J010u03YZ+XNP9B0GdrmSbLNUfuRLOU/BgCziFqM3NQdf+szD
	vOBuBVTiI0BgqTtI4xNOnFcnCstCrwwFhGY4d8ucSiXDizdzVXWEP31y4aC2uIXqt/06VYUfECF
	pmuDmEntEnCXAjkfIiG7XkJz6ckwb5NhH8j8HwMx1ZPcQKDhW9k438FLpEsrQxlTeXBxBx3yW/k
	YsigMT3r7547z4PfQ+apPL7jv3vPKs07glPl+VZkmcdbWX8Iu4OQGR8llaZJdCgSDUMjSwBOYf/
	UaWiPDgmkH5KB2c1BppeuXRSvgc3FHtDZ5qkEFu19Ve2yunYkzNW4qsHA+Y/qu9OIjzgqZPRnMy
	IJJJQageHFKXgkCpK6DNZFhNcChQo15L53enSoxf2fZbWLJE9i3IJ0fDZYeb1ZiDRzXIqN5A=
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458793eec.0.1795447938653;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458731eec.0.1795447938084;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5516406a12.9.2026.11.23.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Message-ID: <b777e26d-98a1-4cef-96f6-cdab7918a1cc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:32:13 +0100
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
Subject: Re: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
 <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y7dNxt0Kvlv_3OaS7wvBmivx1jiMTxNq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX1DVTXnVjg94V
 LY2e92K1HygZzz/twYXje8KxHRMebiYzNHXUD5cPj8OBxBqyZ0ZK8rcFIVN6J+7YFbdh00I0gxu
 xHgLZu4LR0tNvnuGAHxFh142aKlKaVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX5dBcpsPXtP8Q
 W07w/t4NMOcyZgJ4P3fpRT5OSR851w3vkjGhyKC68pSFdtzp2+dI9hjaZ3+YTb5/vKvaIe36KBl
 508nrwVyMDTGNSDBjpWahZ6ukrNIe2JGb/dpZRuK/O9WV2XLdnszXtQCTZyHWj/bnIBv39+ein5
 3iuOhgjTasLML9AKtMEB29ns8SNA1Ion0SxXNbq9FWQ+5sH1lJUTVHqnKaGXo4xVVwiFIcuBXoc
 lPfCaRMpdZGMYA4UO/wsSo6D06LpOQp4P0m+7CSzNlDdxrjIVHau8+p4v9sKWl2BaJazsgG7ySi
 a9pLjrelZIyKkcomInH21V0C/hVU+Y8ew2xQIysjPVxMVSfpBCo/+9ycF8bIP3MMlN2kzCF9BXv
 98iHo6/KdHW2hAeBWtErTYDMZZC4OvvL+baLxe1Wetzfq91sMjo1c+TMYdIyREUQXaLQjthJBkw
 9q2ydb7xvPCPl27pLCQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b045c83 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EZJCw1MXRrN0MplZF-sA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Y7dNxt0Kvlv_3OaS7wvBmivx1jiMTxNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/19/26 1:56 PM, Krishna Chaitanya Chundru wrote:
> Add support for MHI bandwidth scaling, which reduces power consumption
> if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Curiosity, not necessarily a blocker - do other ath12k chips also support
it?

Konrad
