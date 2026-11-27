Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772198;
	b=r+WkrYOB2LSzNqcRULcvQMfxv38cViYLdZe4Tbwsvmj9qF4TN3YD60QUfUAcyy6oEcW1
	 sEOqPpELEQK0B40DnS+CU+kWUo9ClcJ5yyYUPd8X6Q07ButL3dpMIMrfEix17qP/KlFE1
	 +AKdbz0D3C5tMlyFDBpbre2ILY+MAzTPGc4zOKN4sQqMky+RNFjc+HTjDFgEG0BPe5Gi7
	 oRvojpY9eyrWc2skkq08gqZ+NKbYWir5+B0v0sDQe2HwVueExtrqYs5HSFPvOi0odQl43
	 EcAtQeVOyggBX9VK0iZpQHyUBYd9JsgtmXdfbWi/8nUGY0gSoWo0DXTjd2s0qyVxipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
	b=uk9lXcfzlpY32qL71OKtMF1dScbAviSGbYN50GFjyEToPcQAZ82cvhsOKyu6fNIqEong
	 DdXwKNYa9vhZLvl1Csu1iuM814FUgo/znHhnYqnkSvm/mXgZ7FvmPXBFcYiuuOJ/DJGOl
	 YunPf25ObGUWf81+efVbgtJACznRePH0kD/qDwirHlvdXdobgKNMpud3G0Rotsp5sT8xF
	 aQy/kaKJ7GUGuj77b3QwSyiGPYKOfkULgCA0FoU4YhFATJuJn1pi8CkiYtYD2lUXUo5jh
	 ctHcbt5w0X7E6KMIQTE+yQimJq8AIO2BuXsnNyOBzxFipUIatSJtZ7KlV0c11lvrQIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCE606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDCE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eepVaFkO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjk4lqsm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H3tf1076532
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xCYv2w/5Bys
	KW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=; b=eepVaFkOnyM83UTWIHlNgbUxcWG
	BajkL0lCb3KCqRsnLolSsnEx4/6q9o00bp/rAh5ifI/UMrVAw80iSJBQNKSF+Bb4
	zS4zqySl/tXHYsJ8FE1wVkhnaVHV0Q0J+Gp64blhnBaFQlEaCvbETJkdCQYqGAsy
	zGTXhavPSvQfRUUU2AYkHSEkTZWu/uIH5fconA+ZpXJKMLG364732+hSeSa7dq6p
	nZy1Dmd+ruEHXX4pYN30mBNS6DVnElgE9MJ37ZN3Vbt/uVErHEALQuKhmjJS1poc
	eZMJHc48I9PW7CbxHLLHiPJ4a1c/fKI1ozrCQc8oGQLc/cGH/lkGFgmDHtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55t88u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:36:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so8353973b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772195; x=1796376995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=jjk4lqsmdjW0BvlwFEoUMjJR9sikOhsmhuEkKgabTL/3OK2ZUeoAaWycmYK3qgEXVQ
         sAK6wT3YE0LPXwI54x/fdPHgTLnzeQv3oStnsqYT0Qm04WsBy5PYuQDM50yXfy+RyhyA
         7OVlCtm9jolmgha5EGVZspUdjnWgmN2Av65PK1/B2e09o2Kw5GtXJI+0goFeBqMFR3wo
         39jV8+YYAR+WGXddwc77JHNsWMJQB5LCbMZetTSO52cfCTVUXBjAc0xRyCwtqYjdZOhb
         IML8QvWlWzoXf1SXVVrWHp+RZ7UIUsgSJJbpzK/O4TsOmprIH102GSHSiUOhTKGseQdu
         nmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772195; x=1796376995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCYv2w/5BysKW2kccsXcVHwyXsZaG9BktG8t0e1CjWk=;
        b=QQ2UXgCFYEy0FweXwcuTW7TpCKx1w9GikSk8ZXI9NuPeftwgyofgXUhvNRyX7YBhaH
         2lizeiGdjFnLRDKNDd8/uzy6d7bV7BwuInmq+6Hjb0dI0bLFQov81BXsW2Qm8Bh+dw8M
         yUzButaDhyDx+LNV+jZ56lcEq4MSaLz62irjQOG2Z5Jjy6H9sD1mWB6xvktbJ/nAN82L
         emM3uC0UqE1SrNkyK9vEftzwng6nPj+Hw7ra8saaWVtliYoeK7f9wFIzrbELZN5wFCSS
         2l9bv4aZLpMHmjyjXgecEA+86Zmi8ZZg34AHI/9olpFe+JBiN1H8XTCyU+jT7b9b0iLs
         8svA==
X-Forwarded-Encrypted: i=1; AL+hErE84/JAAOvNJZmcVTn/iExDBcteE7sLuUuSbFWVfIhjV6vGRmtU+oW17mpnZxgmJ7gqdWNK0uFfo8Rmsto=@vger.kernel.org
X-Gm-Message-State: APuU4Z89KMrAVd2DTpB+Srs9cOMdKy2pVPzfMxQH1NaCdjaihOJuTPS6
	891q8S+gzD/m5ih+OPMiwg4jo0408JusqNNn2Iued9PP3ZUF9V8hzDeGnEsVKSnvDvWRBABwZJV
	glksI6Ytp2TeIwOymsOHuBjFqoVuSF/PNROzJhKlpAJiUD9lWwqL2dH+HXtYcYeWV5qk=
X-Gm-Gg: AZFdTZcNQr3NwRnduBVKNsl01yfNftx5CaUtdXkEMRYTsZCKP5TfGX+05AyCB6oD5HY
	E2URbEkCz6PEc9H5T7dXYzFIswC1b3UegwPwbQ6zFQyg24DjRDQ27tQGZz3KSsdHYh80CWeYK9h
	jx3C1iCuH/cSeRMiy8dM/9xwA00A/Eh1rfLHFOaMAPyKDnwpvQgcks9tEeOfEp77VMihliECus5
	2yO8Xxayg3Q1ZSWvDpgEb/9w7vZFckliU3hKTGCR4r6LAIZ6mbM1XyyqFxJISeIa30hgTP1Txr3
	HG+RR4x9YSU+/HMnVHCzsxatXo26cdXjR2mqUhrhhcAselt0GipVdQRhF2VfRmJUy3SBtY8vC7s
	6eznU43HQJe9l7K+Vp+f2R7BIYWitlY2r2fnMbjruw6O8wTuetx5o4aicMlukXUvpjJ6kNMirFv
	8i5//Qq/voYwy+rboS+VYB6b7wmPaqiKmkxUaec66pQNFTgfpRCrNN78Y=
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23327025b3a.38.1795772195412;
        Fri, 27 Nov 2026 01:36:35 -0800 (PST)
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr23326998b3a.38.1795772194965;
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm12384340b3a.53.2026.11.27.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:36:34 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Fri, 27 Nov 2026 15:06:27 +0530
Message-ID: <20261127093627.3292152-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com> <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX9lFFWT7HmbaA
 H6A9jDUjO1JuVRB34HARqBrG5EsoVDMpYfSct3yhgfmhKwKmKFPFWDUL/CplVhN68OXwFdaUAaD
 1RdqXV5K8eA8YqFc23jiJd7t5SlJBdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX9BQD5wudevcD
 59SuSP1EE1rEhCZchnJFHHCY6USa/AfTIuAY15P5VsJBXvNQZRJ/c4twGDdQFPIDDFbx8MebCfe
 NyNMbxHeLAdJLg+jaBk1M1ooeQ9twH/PBDs8cEHQf06ozUOSdS5rVBTMdX3t3ZvMHTOHFcKinzj
 yHVGi0ljpW4HCJ15ww0wrXa2F3owJvk4XzBGDg9nnza120DNauKXbqJSAc7MaWeDZ3aA4uEYj0a
 Pw/oQneV5KWgWGKY9aeZ6bxVAVb1/wU9qdiuQ9icSolMTFPHSRegtBgqXxDOFJrmrkvNHn/s3Kt
 v7prgQX0jjFMR7ABMArq0fwuMYBit0roKsiUdLgPNpWdkI1uXAwQRezljN2pjgaXhNu0euORz7n
 vI5RhbVsv9id5HUeHa1jSkxjL/cbcRPb+Vsy7Ka/YZfl9QxU3odPLKWdwQT98dUyNwmsqCE5+8S
 9xaaxe/7WQtOK7yMmeQ==
X-Proofpoint-ORIG-GUID: y_8OhjAHegOsb4PTIUZWCRDFc0Qd4UsU
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b094f24 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RgwWSSqwODVOsrknLmAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: y_8OhjAHegOsb4PTIUZWCRDFc0Qd4UsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 05:26:14PM +0530, Mukesh Ojha wrote:
> On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> > Add the TLMM pin controller binding and driver for the Qualcomm Seca
> > automotive SoC.
>
> Where is the introduction of Seca ? what is  Seca..?

Seca is a Qualcomm automotive SoC. Its base device tree and the Seca
Ride reference board were posted separately:

https://lore.kernel.org/r/cover.1795517711.git.yadu.mg@oss.qualcomm.com

v2 will add a short introduction of the SoC to this cover letter and
link the DTS series, so the pinctrl series can be read on its own.

Yadu
