Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169046;
	b=J9DSj95q2E+Ql96nWZ8GJoJNn3NQb0Zql7HIlamsVMYNIACVF+cE+Ux8e890cIl4N0V1
	 AsvAwVFbUm6LmrW8KeT9WLYlmI43qFPycaxY+Z532jHHuYIaprfZ/7EPSlfudHeBqpE+g
	 Q35HTX8PAMXVh0rEhQQExoK3igZphVXgya/lG+T/Rl3AB4NPE0Jvoi58Ksm78AcyXisol
	 P7JDY+8GMNGys70VTGCrzusjUpc0aVnUxjAWRAl4+dH0GRSnKDtNkDeVUG5c6HnB3xdzF
	 GaqAyqGFLEB0t56TAB1XcCWjeR7flScaHe8YyxYH/L/xwSeptrLtvSaxgPgToVobB+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
	b=RmrYyISXO2QVWPe0U5juxmzG34CHrW55BDow5M+NMfJqm44qPXh6Urkc/H9HCoi5ZlPm
	 kZldxWHl86sXkCu5i3uVAlj00/rijbomuQ9OeeS4M2lo1rr4s5Gw9J6jpasGNMbZRCoyI
	 7qorZPTL8k72cV+XgX89e5RCyS9z45wlB37S7+F1CROWCZ9jDqr/+4kGZzPQR62ZZUnJC
	 yQ20s6kh8iHMopFcdiqlgaSu6J+dBKXJa+LEfYc493JJc14P3qtLJhlLLrnMwZfuMXhlH
	 FSBo/7r1eKzMcDr2rGpYTeJ2rvGoAd9Bd38ZL/f0rYW++5qleJomGXPyDHbShEZiIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB808606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB808606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esH92019478
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXNcxzw/XZ79aNJphecWCC2a
	iJVKnB4p3dOXUqbKOGM=; b=XVGSAI2Y9lu0xVYuUhtuwNE5yFeCuOpjrfxDpGQR
	Jr0yb/LpmIbzacgKDnFDaUoWzehuySC/rOqdRv7EFCTUguJ0K/KpTp1cOnPQYo+W
	4IyQjZ27SvSDfAi4EqprlOZW2Un6M4hwrt9qG9QGC+10wRSGeLIs0SEx+eKwCvxF
	yf32JVCWbvhPAdxPj16V/QeLqzEwNAHARx1VkIQBaCRGaMhr3o1L28et2yrp4tLH
	QdMAGsFCSW2VskIVolgZi6m8w/nKPDGWlqT7+ZaIu6mN8goNpcrFSdlojQuwMWtB
	p9rGR7mQZMiacyK6Mw7gKceeAgzvpkNsyWzBcf5TZbxR0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj97c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so91483285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169043; x=1795773843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=jHj2y3RUqKEBd4XmzlMHklAh2e8sXGEG5i/dGI2P8aKJr8Rd7JmsUuQtPfG+Ot7PZx
         Erks4KA36xRu+wmF8oSKK2xc90AnNpklbaxsjpl1bow0dTusgOtT2cFsX/m1bYCZtdPM
         qZsAzj+pnHaiDKZ4zUbDhJSyBA9ZeFw1XIKEWoO9bilxXlOJa1Q1wJYuYWnyAQdULRba
         KE924JnA2yY8bkvO1J3gzGVNKvQQhzkW/q8aQJR0NZZ5CLMfp7bQHXYvoafoitQTH1Ia
         jLYlvJk3nkB9muwoqBKNN+pFqCm4Ytaz3p0IJytLKbXi7nZ3hAu3slY6fMDVAT9fqwYZ
         TOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169043; x=1795773843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=itHpetr8ikybwZIVi2B1FtaNeEtksjMsDB/YrntNtcLeVnVjD23GQsWskMY6njOW4B
         5ATVW0rWlE2dHTG5GlZGPWN2G7C8G29HLvl5SkRCU3UkAWucmG+Do9xlXSaxEVBR96sX
         WhcUe2nFql+GlTImTJ/lLWe/9YT0uNspAzHbntcOjqZ3oovUbU7K13gFeBNHNjSHJyOu
         0l1ZCpMwY4SXmPSlQP3/1ilR7YufzpRfLqjw9kmAPQo+9eP9/gH3aBIwDTdawFvFikI2
         kPc6XnTppZ+aXeVidDHe/qkKvujEGyz28mcGKVki6A+RMSg3iFr1XLnM1JwIYJ7p/+f/
         dSPQ==
X-Forwarded-Encrypted: i=1; AL+hErHyB00ae/uUYCd9yboarEQ7+EaSATbq6VXPHVJIWcFijmpYIZdQ9uONgHud26CF31OHHRmL3D5VJvurcew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bYh0bV5HzbyiOQ9vEAdmOpXG+SVFPqNAADVIJ+7kWFfbo3MCy
	ooupL4o6ocLLSpBqkrMhEiKgLfR48IJymRt6onfr9a/uiEIX3UV3SU0Hhb8TPvWpHM4sDb+4xE7
	dtb/yHF/3kvNpCzrHUn5SZp34HeX8gTuXTrsAJrBO9VMhprHfZQQZc0CGPtzGvzsaiJw=
X-Gm-Gg: AYBFou3lTdDFlgXNKyNB8PTsqTUxi7BVcCGoA2bGfNDtNQvrJBkZys+n2CNlIeqFlOv
	NsRWYFlIdP9szVDffTmYpSWOvLi7z/O+vMyhDVYROlMaVYM+R0tNIwtr3dk45wl8eeG1H6x918/
	E/jL/9v52OIP2cQ84vSu5EyIyrgg/UN3pob3U4jvPVJoVZ4BmvKLeStxQQTdFKwZEircHG8mM1s
	8271Ik366JZ7Z3jRKcJCvFwPc/bGp+9RcW4oQzj9dLGW0/Q+ePfuuEH4LDLIjyGPVYisjENw7QJ
	Mq+S80YUwZT6he+zT41uYGn38sb7/lKKu0cGrH+wVWnEfZ9MH6hQR4HlyX6LDXubfGu2JZx+c8j
	dJljZsJSzaITXo5JK6LwGfbnPAidQvQ9juU57xr7meFuAGHWv6X5WphY1NcTef79b
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51904885a.56.1795169043200;
        Fri, 20 Nov 2026 02:04:03 -0800 (PST)
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51901785a.56.1795169042588;
        Fri, 20 Nov 2026 02:04:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm107120085e9.15.2026.11.20.02.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:01 -0800 (PST)
Date: Fri, 20 Nov 2026 12:03:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] soc: qcom: pd-mapper: Add support for Molokai
Message-ID: <prbf6six5jwxdyz6nz2qvtvgbmrpo3wgalzxxskq6542mi7aea@fxd2xclmjgwp>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
 <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
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
In-Reply-To: <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b001b14 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1uJLEA4eyktsYfoyBTQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX4LWMOHW90u4P
 r+LV6jF56QHNwLUWhIFcQbtexVA5vSOVy1EOs8nuaJrK1V1MGZFv3rdh0BOoQaNcX8cCYgG2w/w
 MpVz96dCdCA+3rB02LhNtuUJb8tOtzg=
X-Proofpoint-ORIG-GUID: Fr8xDV-lr0jZwFww9LytxJYnh8lAJi0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXzZwrvlYK7TnY
 HrF05vj5a4/FbxLhjQCDdtE5DLyaKFVEOk8USKqYnmJ+ceO58vVhd0NNYcSIl0oIlvGLCNQ1b4h
 IOR7QVK61krSwIXz85gu020H8KbwbQfNNN5cypMhZMv9XTgQm9hPBoxzI/QXmIUL1TRCGGLH52n
 ay+MoKahhAxx8OFDWPCnvAkJ7gvae/evBXA8598uNyP3GazlnOdGT7gUKN8AHsJ99lBIyVfB81u
 4bXGBvtkSUk7jBOQxzyo9SMlky3YHakEG7PusgWc++PLBCSVkb3884mUbuB/3YaLhwomb39MU9T
 wadTA5Bzfa8Xl8nmpM8fMaWp6SNoX5u5Qrhr79eRFk1O8RD7WMMS5NhITb+mqBtUxQTy56ULvEO
 64u6Ej3nkO/ERXjFLFNO/vUFmfLxNV2fA3zcsDmmKVEHj3Fhs9ZEjP8W+yHmaRY2EpPWsCsp4TI
 NVY1aoozCXKA7WyM17g==
X-Proofpoint-GUID: Fr8xDV-lr0jZwFww9LytxJYnh8lAJi0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-16 13:10:03, Venkat Yadlapati wrote:
> Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.
> 
> An LLM was used to help write this commit message.

So a single line was written by LLM and then another line tells us that.

IMO, the second line is should be dropped.
