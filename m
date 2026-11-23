Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445340;
	b=B9XeZwjTWB94RJhhJN5EatVYWQyesp/0HP/yggw9vA03F4lM4x9QS400oJ7G4E8a31Z9
	 lNCfsy/YUlftzCEaDawhYLrC7H+ACfgBY63WBzd45an75O2n55G8W0HcPffDH1QgnGSia
	 abZKYRztzYNpWng9CHxzkctO21sVYm2cBgsypTn2sYOHLoisXgTpoJbgrQhGyIHcZixZy
	 AY2Q2OlA1LH12auZLIvtTpXREXnm2HjsCRwSQCZLb+z9igG9/9fczYkFAmG4sASZbgdgc
	 lZaOoewj00s9lyhmVpt2HpGCVhCjW4MPpdYxXV2T+2755KCmUDGiTP7Kez3S136ZwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
	b=0NNsqVLtYdVIH5F6x5zfrWx/r7fYfxwGATtAhHwX31q/LsSDEZHyEob/my1pp3MUl1Vt
	 rV55EyWw2+PBRMcTl7XxFvSHAJLa4vr+KMukcSYEMxewM4aIqFG50rCJx6DCOxqe7mU1I
	 spKHEtM7+qu3J53y8xFp/qgtXZP3gfgu1aCHxa5JzcU5THJ7/QbwaNP1wE2bUQmLKYAo0
	 C1TYjtHX33ebYzGwWPGBQBW5BR0ULQljEY6r7od9ob92ZpAuRLntaU5SccupSwJkwfy0z
	 yIuVf24MBGS7YTzm9rk5OcuOA8YpAh6U9gzwTofgsE8aWnH7f85P7IzRBBgUHpvvjdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F95606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F95606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL799694259
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=; b=F0Sm1c7JRzX7fvK6
	XeOFGXUg45CR5LVVDcMKJ3oVzjSiZ8KWoL+W8MXqEDIxwngQpLsy9o9b30AVAhlQ
	c2nydHb/SMMdVZcgWOOXuQIGnDy8/Syrh4xE20VK/5upvKTve5fThoBL0eKuR1y9
	Tako8aUQFEjLZDtMS811xarS/V0YhoU8VS5z+nscFakKcNvKSOM0UGgNKVDGte4J
	6E3fOMbsFbhPi+P7hrdfDMo6szL2hDdJ7TiOyyyoQIvuFkplifazX450u5xeAj0r
	ggR71aUnECanCvVqALZFw3veWSHl9NN8AUAtft5mdwPVbgF3e6XElzBaW6Yu+o0a
	Yc72Sw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rt6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eab0467c89so4238977e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445337; x=1796050137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=CjS8a3QQJ/MDDbIe5tqqwX+7fb2l5BfWXZH5b1sOkfQxizgHb2SsJ8bDHCbuvmK+/G
         HCJ7Y/5t7vMAR2cuM8zGN90+hIhl8hvvW1nl4xRXHeUznFQzTTYlLZJPrMus9xUdM4cG
         o7IB1IzXFPGuDxKhydqakUwmrBBdw/aV/KZ0/Lvo3rtOrmx701DsBRHKhBmA90cyu5lk
         gtEGoBkBLiPhNQLOLlL4UlIt/cXBpxYXcCOQOOchsKQIArZWOTFBbQtxcH18uMvMc/Eg
         KcAadn+qQwvDGsLIqLJs5eCWZc5KKDF1Ihy1yDzZw6FYeFulCnpO/J2NffwbEdVr7PSn
         YZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445337; x=1796050137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=g8zKhEp5ENijL0Dk/7g5GVrdXfbmBYEQ5MrbP+bd9FdPcShb4LAKA+LpkTnA4I4YlO
         nbHuQx3BLHTTabBaxmfbxFVBhj2PHESmeHu3pBi5hgA/2+kKEwBNumCvnd95mUDDeIem
         /WAi6cMQLCP9ZACdZ4ma9+DfFRI8Jfj9hdTQ3q5nCQkARb42srtXDhffCFbQqre+gL7Q
         EcmN0cSEIsjPwXVHzgIo4kHXeq1fMzM55q8LguE1e0Uu8yTYzWEHt410TQEo5RrX6Mo/
         AqbVyRaHIxaQROGrjLXq2ZNLhbfivAq1rRwiFVTMbiAMJ2h7TKgUveAFHshnFtJQDK1p
         A8QQ==
X-Forwarded-Encrypted: i=1; AL+hErHPKohfDHX+AuIx7hjQNnK7q+R95xPq/iwhRyctLEoM4Gy+RiSImiieYJa+VSY+OrqHYbqlLAyxNSCnPks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8weSTQb67VhXf4NWzsiokl3fVud6tP2XAeUfDE03axbxtrO+Hk
	JBooxsCpeKLH+vjlHhXr7qUuG+by1ACer/scmLRQwkRbamGF8MvgeqcxYoY2R4waP/KH4MM+SZ6
	TyV3N1H+eXeJgpPKMI3nJwCAv4zf9Km62Id28gwxfnZvKfIKhO9imR0KUZUm+wZdFbI0=
X-Gm-Gg: AZFdTZdK3/C4vNRPspA7T/+ZAgEVA+bUTieF5u5XSVQF2er5237PMJo9KvL3gUHuh/X
	lg4Lz2rG3nmFhJJG6NWYshcw5TWskKDC/TA7vNTO8lDOBLr0qfERNEEBLLDqw2GBDOKz6zOUutj
	Q5YlNsSEFquRLNuFWDfl0qI78wqedn8iKgCIC8sBFGgoY3HfUlP1/nJ8Frh9UGgxpuikxg49KUB
	dAIChf2fFhhqZYIex/ejLPQ/jz+Jxn7HWh84d0DD0QNeX5gd0/NanScb68jWii9lF50tDh2bxZy
	FWWJ+SVzh806eon8hNHqQL63XzRfCjHxsGOIHgk/f8wXlnEFFvABdZGEHjm8Pp8fpQX2IDo3BMz
	Z0z+iXFMSvsryAMu33A9Gcf1jTcFcF5uj3SH6OhLUMzIBKXLACx/BESL2D7lu7lvIRFIEwKLwx4
	71z0P+CL0jz4GIBI3tVgUCyH9plElNsYRLPzd4qt07e7Mzh7GUaryOlEjBXGywMQ==
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086684e0c.5.1795445337309;
        Mon, 23 Nov 2026 06:48:57 -0800 (PST)
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086642e0c.5.1795445336819;
        Mon, 23 Nov 2026 06:48:56 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm176824865e9.1.2026.11.23.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:48:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
Date: Mon, 23 Nov 2026 15:48:52 +0100
Message-ID: <179544532972.78418.5551704797974851196.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: djuNaImeW-zHVOhib38ab1xzE-w04eVy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX9kq3jjsrVi4j
 pz8Wr5SLR8tfD8nBaRycY7HjQTDrOB6KrmSlkZlwnDU8vFXK8fcP6VR8OK006m6Aj0zbz4lZeBL
 1Lo/Lv/iUB2EfiHpNuFyr9K+DfrdwtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX7Iri3DroMQ04
 26A3SYHEl26gWYPYwL6SuqpfseLPcovYEm2/o7twndxOE60shgupdyRCMOomE7GoNQ528z5u3A0
 hWNMdamJo44VM6c3SU2cxuAQ1pup/leguEg3gqDHYTu0sLVl2YBTRC8H3YyQWKa+qMyZDo51XOZ
 /zJegtGpIhbGuWqMrPFQLTMKHoZbNnQ0O4VdwmhLVCe4ggPpxsH3K3qQT4XKIkNf4+sy0TwBF7T
 lTLHpVyUiWn8qmBK4d8wcIEsDjd0Hg53rt2hJUcjZdAUYXM2zGvdnImZOqkY20epq6IXdP4xgag
 ELS2VKniu4Abu3RKCboXhTyn1XZK+Ou8rmXSxasi5yc5XyNPLBZ1cH0D9BnLcf7kyptypcaMJz9
 X3SNcBXd0B6pSE1SQjYzjzf1suOFhv5SXUTWLlTgitCse6N417feNrWIVetXlDG2vQltciZ/eGG
 3V629rU2u6ozNxFUWrg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04525b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YyyA3Ubz8UxOzji9argA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: djuNaImeW-zHVOhib38ab1xzE-w04eVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058


On Wed, 18 Nov 2026 19:07:29 +0530, Gopi Chandra Sekhar Reddy Kanala wrote:
> The LPASS LPI pin controllers only have runtime PM callbacks, so their
> clock votes stay held across system suspend when a consumer, such as a
> SoundWire controller, is active when suspend starts. On Glymur CRD this
> keeps CX and DDR from collapsing in s2idle.
> 
> Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
> driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
> and pm_runtime_force_resume() as the system sleep callbacks there, so
> the fix covers all the SoC-specific drivers.
> 
> [...]

Applied, thanks!

[1/2] pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      https://git.kernel.org/brgl/c/d4a6257af491f8a087d34bd5d3f4cd384d4fe266
[2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
      https://git.kernel.org/brgl/c/55d571be69fa9b1ecf8b417fdf768c4eb8b28d23

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
