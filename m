Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524426;
	b=0ElqJ9IJ53KiFEPnJrPa18ruky46jTjsuQavrFi1iOhcq2YOygj6LleAHhhNdeAqiIqU
	 enEHJJ4hvECmahUj7nIQalcuNv1SRIti75ZNJG4u7CDq3jsMM1OvdpNfKfQyD1apx2KJ2
	 RWQEzmB6KicvT1h+serBg25t7g0I3yXB7tPukRKn73FwHLzBr5ZlMduDCsyY4+kXFOsbJ
	 dofa8HX/4umtcEOLb6YUL+h8CXNp/gNj96jdseoJ3RDhAcn4xkDUoBM1HcMC4UJJBTMGp
	 O0bMwBzHMhLSQolwcRxBgU84C4r0Y6jqDW9TeMQtnTENdVjnT4bxqlba/4SYC4potVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
	b=iVcYUYCX8ew9DHHJsn3y+abLvknoz60zMcSjkUAzuA6RKC8UKnz1Cfp8hbLpP1Tfi+k6
	 wreE2DP10KChcaaF3DxRH6/JMpM9iFKGQYtBUJvv0Za78zpHF6WJWuErmVfdR22/GvRsl
	 1CkFI1SV6edyHJTfBO4XiF56XMQP6G1LHCOk2uKEiDomotbLR5NZ037TFRylOMzjOHlCf
	 u1630uNexFdNeWRm+cmRYgDMBqnOLKcewMxF+VQtUyxHtHcqbTCPQogo5PDqIKwiD38TG
	 M10IwyMMwWcoVkXPe6TutHzXS2Ck7lfmEggTEqAK0K63P8ybZiV4fYtMJM2omdHVA0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncGW22fl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BAoZjBP/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21A606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC21A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncGW22fl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAoZjBP/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuiU7601617
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=; b=ncGW22flIvYi3iND
	XCdk/DamqlPZO/Fqvz/S6CM+w3yvN85x3dRM3Gg8gzmIIxceeMVhSOPNAnN/Ped/
	bqzI2Q5VXPaMVb0ouTgaPxclk9vX5Nh74tadL/wO8Hl19cWiyqQ2Hwn8KchyvDHa
	WfZo9eW4q1F1bvobBac21KEmJvXq88796LCbM7Uixbv9bcHBhtr3FXSw/l7+jBny
	Yq219w1LVPCIUIFyXapFABG03JZUdEGTYostCo/ixykLoUuxc15Om9qda4RXvaAb
	CwUcVtYHN7ssxyZoZTcagQKxCXvf2Yg8BHeGdsbrTPU8VVqy0HUmq2yOkGT7pR/G
	5azjhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky2m5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495af07676so703577885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524424; x=1796129224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
        b=BAoZjBP/RMU+ou9+0QjUrmNnHGhetrtF9eiqAtd+nLY74d9z+XivP6DYm40bEVVcyX
         frYk0ZSZ/MQTi6u32xlNBjMS4IW7afAOXy5k6tVDE94TmpDyTe6Du0zVQ7VdnugcL5q5
         2Ojia+5PsRGJCDBpGQHwA206G067w6/TvEIdvIwsDGVT2PwpRjOexLmQwrjYgLMfwwDj
         1QPygs9vAxYoQwfgXPAJfM4bCpT8YNuoJkDlds/OTvBMIB0dtR0ulFeAtGN0nuaicZD9
         m1r1PC+ZNTjVmYruUlEo8ErObsrrJxGvJppVRki/ybghp1PjDE/XQaLp93R749bEU5lJ
         SZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524424; x=1796129224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
        b=FPWwMQh2wwMYi544JO3VtLOBjr3o4uyaCKtkS7fBR6bif0JrRVTh1fjtdaeww31Wic
         QRAL+9wIND5XGqGT7AO1da8krezm7NqaA/ghNJbJTzvKy5On+KE5THjaTRQ6joI/BN2n
         jAO2pSPx9O6v81ObqmPYhEZ1Du4kpvon+75i6XI6eeUmR+mikQOQVzLTZMYaD/1rVGa9
         uwd+28xBoxZNep83sZ4Z2WjsbAIIb2I4l+A4nlyn7LmIHkiTCz/9/x8kPJ0FXucqjrJP
         Pg5Fx0cckUZ+3ieYTBrrGnysWyDa4lUeK5bji5IN6CGrRWdeNqPZv58Pdef8WViM3HFV
         DnlA==
X-Forwarded-Encrypted: i=1; AL+hErGZyyNB5Mq5llF6T43qv4qJvND06HXz/iMqcBWCe15cDWaVF7ub6W8yHrSpBBp+M15fKIf/0GtRa8t2/Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zqt5/rrR+QzH6vSlhRshx+NGL6/fqUMmyKMesW2G7qSlDHpUT
	WrNiHpYYx6C+LvbRJp3VgO/fgfHtb6RwDZUr+43rw7dSTqBiqYFF3w1f/BdImOw5X0zgWUYfNE7
	BzHkplrFaCtp1Q72fM8erz4BW3PWbBPmVvMOQr2IBZAouzmXIPQGTC62ROIShw/x/m9E=
X-Gm-Gg: AZFdTZdOApkoGmiexhnmyGnI9oCfFbJ/d0eHHe5DkaIo5EiD+p5/cLSC5QpyUdAkJ7z
	obSZEKKYaO2dogLnOc6sJjlWbcf3A/Mk26TLdq7jb7pzT0LWxeATdsemdadGRoBd5SvNi0JfRaB
	TMH21yodiyOKhQGCaYdTf2fEfYVk+ZQtZwtV9gKsWmUBJc/OZdaaIMv0SS4/PczuPx/M2mWIH2O
	ISrw7SPizlwvGrOWwK3YtqhpdRSgVZ4Oup4ZHUk4jBjg699lUC+k3PbuVWKF5iXeOCykiuJkkyY
	KTWWN4V6loLthQQgsENvSg1dgvs1FjDx4Jcq66QZwyqQ1Obj+dWUmuyCTpEd47AKwXtJcfiM1ZM
	/edbhS7CWUnfCDbZ7zV5QF8Hq8L916evMj2eq1NT9AfWlaa6siB0pmHYKOIkmfEb/JtYr2tWf5x
	kerH5TlWOsw4sQgN7lEimP2dY/TKgO+mlaPIUx/atgO/+u9nJaol0Tgdgx3XTy2A==
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr2401291585a.56.1795524424169;
        Tue, 24 Nov 2026 04:47:04 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr2401287085a.56.1795524423707;
        Tue, 24 Nov 2026 04:47:03 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm162284495e9.4.2026.11.24.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:47:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Cong Nguyen <congnt264@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Jiawen Liu <1298662399@qq.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not unprepare the debounce clock twice on probe failure
Date: Tue, 24 Nov 2026 13:47:00 +0100
Message-ID: <179552439935.17414.3815780367440771141.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124085231.3696739-1-congnt264@gmail.com>
References: <20261124085231.3696739-1-congnt264@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b058749 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lcnA47O0JUuAoBXSFRsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ixau511TAnrHkj7gH1RAqxm7wIKwkEhg
X-Proofpoint-ORIG-GUID: ixau511TAnrHkj7gH1RAqxm7wIKwkEhg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX1lW3UZp9KkI/
 xJinI5Y00OVJx2IMYDHiOmNlvNEs/ZTXnewtKyjmwfbUY9qadlL43BUwXwnRQkRev4kvlDJecLO
 zVkv6tggSZ4CbE1KxSGGfNMpDzFPUFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX4Pqx61cV8h3J
 ForeXbvbAmOHNLfPxi+ba1N29wfSdwEAXIUnEiioYy2IlWzb52zTN63qfhI+qbt0fTC3hWTH7B6
 n+NjSWNZktBu7hZc745v/h5e2MSYeadgHWhCY5kI6jZvXga2XPdgomqbmwHr+DRH4LocHHYNXad
 fFv4oaVHBQxDIEPOCoh7q0YANkRg9zUsuA8WP3kbfwyKFGkNGXzTk8+HIGCZN38q0i5HT+/Lh2i
 YyaLsX2Pw1hWCWYp3FIqKdm4VIm3Xs6PzScOclZx2DWno8oeqFkMTZcrL5LGDpawhtpAU+j1E1z
 4+tYk/MMhn/VYxA3bY8GV47xz3jJk+uuNzYCIfuhZm/chGIDn5otSFarfyj6WPdX6xTl4jw+Q+u
 KD+OMPUo0kr+hBLbwZQwAkSaLcArrgErPEUspzf7oG1Agldwa/utNb143tKgZ0Nqe8yVt/9RKEx
 JB6x64ol4456QA9zHsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240049


On Tue, 24 Nov 2026 15:52:31 +0700, Cong Nguyen wrote:
> The debounce clock is now obtained with devm_clk_get_prepared(), so
> devres unprepares it when probe fails or the device is unbound. The error
> path added for a failing pm_runtime_resume_and_get() still calls
> clk_unprepare() on the same clock by hand.
> 
> When pm_runtime_resume_and_get() fails and a debounce clock is present,
> the clock is unprepared twice. The second clk_unprepare() warns that the
> clock is already unprepared.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not unprepare the debounce clock twice on probe failure
      https://git.kernel.org/brgl/c/b43f14590a30eeefd64e1db85f08f9ecea1821d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
