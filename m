Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530481;
	b=ddKP1w8geOtxI2j8i4bwE2pI0aofcgxkOp6UKWgtXq1PaTGHtP5fLK5Gkl0O/KdY2RVY
	 6HNWVLbbWOzyS+DBBcl5lAdOtoziIOs2Fkc8UarPVX02OHTT0qzQ9xdcg9tBzSatjJKKY
	 VyvI+IH9Ev2mMvOyqt2zw00ErY1alcUa8pfbVqtlUPFz81c54LMkIBc8+j3xVlJyJjY0C
	 H0QHQO9osgG7Em+LrYnwQsarO3E7bKshahqaUNsw9+NGf0jsCQ+mRIT6HhcaHL6RprjOK
	 wvkjypFM9GVt6j01FE1xvZihK5eDkHaajv8OzcAOF/e8EszqoMki8Za8MDxA9Z/CTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
	b=aF1dRV6mNM+tuvnPPmgfIb+SkTees1fY+seJ96eFq6wT/WCG630YGO2RSfcg9jio3ypz
	 b1goOUOi+5D/qyVTUUlWYkaTekSbRMy5Vym4AUa6VV0M7ZJuXn4WtDusephj+uDTzDB9y
	 qySl6e22v4yUIEuQa8HEK4wFBtI/h72E7BZkHOBipD21QaGbSI1WIQwe7mHzPnIBVwshK
	 O8ctcmC///8YKmcGsj739R9naBXKG/E2LvQTdD0U4anrR0jp9Exa+oM+zkUrqaJabrw8g
	 njADMxA8SEX+F13EqY2aDfAT7zieAi8Gk2TM52MoDvXffhVUPMnyxto4EqjWoTB1B/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72905606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72905606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJxq636641
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=ehHEymiP2vHy9XnQ
	ME9obw6CtHFbeMT2Aw/3n6M3lSRaUO5J5xly4qxrWUub6qa6o/aDmymIFsNuD6rT
	644KKRGOjTuyAx+fISCxw5uJzuDgb3429BOIaPk5s8uvOdXZDPyIGf5v6I5yrSpS
	eG9gVyRdOpcHf/yHojuxyBpiDDGpjCk5RAvPmX2bWeNF/QXJQ2UH/KPhZ0stBiD8
	+Q/roXCceCYAKGJzSpktDc9qmshL8ojn/FiFneH7pSJax52Y4G01J7aA9SwOoIlG
	s4sH3UhufW4ODC3m8EcaIln+HSmK1V1JJPL6M8nKYx8fIf1NBfGrXRsu4TGJXOla
	Of08Xw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpj82u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:27:59 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679b648598bso7175787d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530479; x=1796135279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=PcmqU5zHSjvRIMQaNxl7yItDrLmz18KHkmTGRDNXxKz2QDcq/YwLiNuiIwFk6c7qly
         REZ6ldKYWxdRd4q1Oaq4+5qYxb/D7uS0fmLwVfDoa5aGzuQNttN2wcflolu79DE35VWT
         i274p/5JosmQFRv6Sh7E0aOwlBWOubsNfDTVOso15lXWHb6gCfD8m/KXdkEFQqU46ljj
         ydUSTtnuyEz/3fmNnAEHP4t618GIvSoSSXPs2m2+tede7nhT5uyZm4Jug7cWIFOKsCUK
         dYw0C9bYhLSEmipDV8u8CKuinuk2pHYnOgCt8nXx8EI4oS3kj3RwAw/BmjW8clqAlzm3
         jNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530479; x=1796135279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=vIBm+IW6hALAGsR2eACaGsiAj7N5h9kGl+4hchz9pQPUIh5ReKJnkYRQE2AeBbVOsA
         /aslby20nr8EtXMhpNaIXfSaB/vzRASnff6isutNkXqIbsNJvE04oEZydqS0bXxA7llp
         x4IjRF0bfy/FtrmTEcEM/VrPbJW8iJA3OYyklAixjIHKzIjPMNMVHew+8PQoW/TID15w
         G1MukcK34Bh/kpnJVMHoHkYubyTPELdkWa23apN11ghiukoVKSS6X5MQ4JPqonOlxck8
         g+kbQ/GhV5aXHDWycibJv8kfmliPmM0gq+SjkuEGU9/USVPvNwRnjM6PR3cqU5LyRrmO
         kC3g==
X-Forwarded-Encrypted: i=1; AL+hErHtrkmNH2osUrGEk1RGpgTQMDNyoTdW7zhZuzL4lftPrHWZbi+NAlxvHY4eMFI88ihQz/5xfe2O6GX8hhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P/gS0uOa4VyjbQcywr+yI8oc0sjELLBOfCtea2eZg/H1W/6wq
	LkYQ7s5k456UfznZVyC6LgfqyZ7DajOrAYq9y9VvM/+U5/iOMtKYNiNeMHZBNUvXgu0TPPxQjMf
	92EHXx12rJkP5xUKgPRfmhtozL7E1qByVdPyb1A1YNtTCdNSVNAt+JN4KDkSFK5oj87s=
X-Gm-Gg: AZFdTZfnQ4G/7bGXOH79An86YSi469RfXKPQum4WoTOz1bl4W1/SKAwuxZm3oSOnYQn
	lsVVIi238S5oKsMIfWMTon/gd6vJNDCfe9/x4X8CAoPtjhOyJ5UGmbh6RgQHTfAwoDAHt2k3tKm
	IYBOV0kkW7xPGMnEwHM7vaQZKw1qHs8QMtyG9/BLp9dQdm+FNAZ8lMEmt09P9TFUQp5OgTxL5wv
	OQZUHMPy3PMRbBKfaoO1dDR4vRVkYVUAQC9Shkos4/7EpvWAMD6t2bcqhuNsh4m1tAuWcYbIxJT
	2+hfh82yr7atoSJF50cZg9/7pOTdG9i+huXIOD68nt5Y7zKRgVB1OeyrJbsBR6uXX+oCNeqvoHK
	yViiBe6GnrpNLOW6Y7XMEMeGGseeRuvA5ED6+piVVkJcrbUAClYMgTMXs+XC0FlV4g+I2oJUl9M
	4SiVLToalyatJF8JnOkg/vR9Bv4aDBo9L30A==
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067702d50.78.1795530478710;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067679d50.78.1795530478139;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33554b5sm7035521d50.13.2026.11.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:27:57 -0800 (PST)
Message-ID: <748d38da-fb00-4f76-9b58-87ad0fe9b770@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 06:27:53 -0800
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
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
 <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXyazJlpUKpSCw
 muoMrdKJdcklcRiWwH+EHUPcjkESfe/J57GARYB3Szf73QQEzscn4cqkRZdlziJECTe+D2YY/Q4
 EFyTZaKWdxnr0n4plRG2F4PfV3IuPcde84oHYXoWHmBBAz1Wt3Nmv2lHk+17SRjEdPxbZN6bthP
 5XYEP9uNxVS5/+DTORzfBaYUgO1JFvAZ308zf/c+tPUxvvXQ2ZXFUMs9Im+EaQ9pML6k8H/OEEh
 XqXZHo9vStBvtmjDVlAJdXA351tcqyIz42ZlfmZV2jPqZfbuBZeNVKHs8v6Nak2brQwNxJGOe8O
 ULwXGzhG/icBnlX2gQr8uERTFbCiPJaCJlR8A5+9epnbR90P+QxODcHM8eKX00jNhAxtNL1WgDV
 jkEPaARs15Ig7ThLBySCKbY7I7FUdYofPWhRy65gDsyfLuMqxjZXvvVDYxpgQULL0XWcwPYEV3j
 y5mimBPY9R7M/vWGpUw==
X-Proofpoint-GUID: GppPxyK83qCFnZoHOuxbpV6nXWAfe_MZ
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b059eef cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UQl-3I4BsUNNjRoNwgMA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX2bBHC2L3ZqBW
 YoGqFsWxFTG7O9LtUHdlz8dKLBpY/fPTPumtrTXXkYdSTA1ZeD8BSdCWdWxRyd+PvDQlpW/aei2
 tqy9kBtzciC7bwyrAyM7f8HhPcnt59E=
X-Proofpoint-ORIG-GUID: GppPxyK83qCFnZoHOuxbpV6nXWAfe_MZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

On 11/23/2026 7:59 AM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:54, Jeff Johnson wrote:
>> Specifically for the DT issue, the original version of this series vetted
>> internally did have a patch to add the device in the PCI registration table,
>> but it was decided to drop it from this patchset when posting to public. We
>> can also drop the DT patch until the point the PCI registration comes.
> 
> Still does not explain why do we want bindings without users...
Concur, and I've asked him to drop the DT change until the series that
introduces the user.

/jeff
