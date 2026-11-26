Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702333;
	b=r38vGAtBnJGU1ns8vboTW0brXvQID6tIC5LoFwa6MEidElc5H5TLyIOJD2XTr/x2Bq+N
	 Eqp8ltCIzuzHY92Ck7fqc3nfRpxNVmfL/9tAvLaaeUPHPTzW2bPuVtPjPK6+uuP+m8VqA
	 1hZOTed+Tf3vOYIHA7X1e+X8olnNmbWSPAHqB34BRfkKgTK0MNgRuuuqkWcfE54mwEdEA
	 ehtzslTkwxVfDMUXv+RP4lgCZFCT77UOUFwhNaLGBpUa0GOjorzcwcuzrpuRh0X1sIO0y
	 k7etQZoMNnAEN05XStEjzhsEMalLJT9V/m7D4kZnyiruA599xOoqO8ze2XeVu443BDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
	b=0BXrxD+Je3DXG0w1N/xYRi7k+vbKdoTxgGgWBTAKClUpUpnxxLecrUl0IIh0O+pT2uIB
	 iQRhqL5ufBGulu1sXVdfqu6sVLUst5XfwE0lhZ6YvfjLrK4gyit4VsCUg/328J6OEZWHd
	 Aq0V6Mo9ulII7o8/mAVKl0+AYdToBrcMc957ghfjGIpRTQokb5s/hPrz3bWClPUhSBBZ4
	 JpbyKyTdCMcjXyMkvqwQ/NNVj+Bcgx6eUcPEY9RWhNSJwntv0QQONZrfVPYpYX08CH1Np
	 d77/UIKPYOjjQ8RoVjvs8c7RwyI9Y9yyPyRyajVhfONlJvEnHryY4PtLSl329vz5oNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY8Dy8Dj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A36606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY8Dy8Dj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUEH2911764
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=; b=CUxIfvFk9k5u6z6R
	dHV9V1FZe02GWgcAY/NmHXhWQ2/3sIDv1dgDpw2F2GGxsmrRS6ijKWloR/I2Ud1G
	Uvgq0OXIKsVN1WCzcJz++CubteZBPLV6i/51Qlg2/hnQv7v1KlhzbpZrAsc5YFwF
	ZNGHhd5oO1kdXJ2d5lX9nK7HEN+1eYViKcFBvuYmBuJTLOIjC+EcuSJXq1zHQeav
	wgA+oDWC2SGeXva1pCY3xLcyQPgA8tX2CPevuRR1BGnrTZS+WD6O12pvR+PvC6WB
	RuQWjk37fwHDW4EUfQXH4UWAQmuosgjYXzHjcIdtishLGE85+mXf47qa0v0R9bim
	vLBKog==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02k1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec8c86fb91so1840224e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702331; x=1796307131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=GY8Dy8DjQI8DrLEXNlGP4y09eou8ROS1m9+DCvtJITw2jtC/1vmfjWbRyuSpb+6M4p
         iXiu9m3FwxOPU3xyWSvEo3aVToFvUPdSITiKj7woPpaniDdfsVIfJb+L+pbVRaUju/xj
         IuUUqTk6HMfpuS3fMZZRcQW3tb8WuGXkcFFWiWyR/6yAqlW/4gdmlctzOIquVt/5UZqH
         zzQTyS8TnA30rXSVLHy6PTFL/RC6fRWxIycFBgVzKXFCGJd8EJsJc3Z7noVMz3TuUnT7
         w3gUrLTNXG9FZhll11a8nXR+EKVFujtr2uTiS983sSC3MhhcX3fnqa+hnF/xRtHYaaJa
         kYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702331; x=1796307131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=jlFUvUpscD5j39JVxneofwj16VZRMBtbHr+OyLR07SphfK0vwG9Ly1GHZWkTfd1XhG
         o6ZlO9toRo1c5878KE7stamOGjydLrI35BuzjbbGMxx3u+zxMgoAYhXAYc2VRXtXen/i
         nET4RI58bYwNE7Ix8qUmPRr13sqxbrKFoUC8+anFlT+OfrIuOO64l/Sl6eIkmpvTtyv1
         W8pHz2d5VNMlt9KAC2Jw2ShG836OJ/tbgKJeMztC/W4CPqqT4OUlt3EUD57b1BYYctij
         nyguoAYbLQCy55Y+rVhVZp5exSwqpL88vV4VqtNDA2ZuTylKKWr0vHaonTvLN47jZHJL
         tvSQ==
X-Forwarded-Encrypted: i=1; AL+hErGT6Wikv9V8LJGSBkdPyJCfScs10aGL5b4hmOHVPsFefX/89ZJmrUPe0PQG2Zf9rKJF/OWUo1hSf4nP+6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z982YZjGFTR/BIpd4Po5TO+FyYCnF31+vYsU0tnVPISCoj1L8Xw
	MeMUnWVyo4HyLE4qu5iNJ+BRRROGZfUfomaORnPllmNp/R92v/3I3B5Un+4zeV+PmZsdiVEZsde
	Oe7+3fZyGq5wZWKOjnhTCTNOR47aG+oxa+me6sm2KixwcLm+RsZTz6YPSmycVy8OgN3U=
X-Gm-Gg: AZFdTZc1hDmU9Y7gXVbbFR8GvqqkRbPI3XYDXL3Betvwx0n9Le2APSt+KWHt+iYagBW
	fNY6zK7UaaDpJSRmad583WPgnlhtosNxvS3gNDk91XrMWopNSPPTSFlXPr/yiDo8sZa/BH7J9uc
	uAP2eC8WQOsT6lVG9K+CXdsk9Xw6IazVZitGIenGa6eWXRN6S9H+6/6TuDSdQdCzEwYcHhl9Lc9
	4OeXcF2ppspEwcnnDRovJYPHAv2ED4Q9TE/rIAGTEBjz6mCZp9MduUwfDjLJ+W8ZppFUg/0QVqU
	Yf/yEIVaBl3MlpDFK+6s8DVIT0W4nVFpWmduhhoqDH/IWXuH6k2Gt8UrXNBcAQXovPsTXqBEoeP
	mkVHaWCA+1XNSKEw4LyggU9oQZDgBqLzMTckRvzjr2Rt1jjPcUNTvqVQZeA9lN3JZH/xB90Fg33
	K6fzSeYQT9OZVAX5BNXZMqua7bm1tuU2gzA9bkrchjnlY4naNAwi/Rokrh8VfzJg==
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13834051e0c.18.1795702331158;
        Thu, 26 Nov 2026 06:12:11 -0800 (PST)
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13833997e0c.18.1795702330684;
        Thu, 26 Nov 2026 06:12:10 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm583807675e9.8.2026.11.26.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:12:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:12:07 +0100
Message-ID: <179570231658.22277.5231642752159310607.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083e3c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IckF0Qp3E-YNKf1sYy4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: RgWYjUtrYigYCb41j84JNnoZ8ncfhCcP
X-Proofpoint-GUID: RgWYjUtrYigYCb41j84JNnoZ8ncfhCcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX0lcNYVzoqNSa
 4wykttszd+KodqZAsHcNsEuHcJbUpZRb3LyUke+GsQtwlwdvTsCnB4wBHkcOJfvvZaNqhnG/nrs
 qyXFFI8siGGfKedBraW+AekVKMBDEm02MuIfxVl4saQdnf2AuziTcvXh0xK9r/BCHB92Rc4sPlb
 YI2dOagy4mbWC2NNpTYdNYN0wRSZ4XGsuyahlJM5ybUsoBZOxjP6Od+sHmR4bSVD54T9zriYtuI
 0A/k6qBOX5Na4okkGP3ByzWFQAvtwexPdc1ngNm9HiOK9fO8+4sRJXr5oqfK//l9OzFGUtmmyT+
 rkiYw3hntfpV3sZXAuzOKww5NpS3p3lU9M008ZDrsJGDQJZTgeFZxDysuxVRlwpoogESoYPB+ge
 HlMr86e6IichLFLjqBwDQdszQfK9hrzZpI7fYhj5K2b/U0FnqnFQrWHheyvt/pEdnovwsByaBxR
 7r5Q5m4td72G7zA8faA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX2w+HtxurZcn1
 PbdVCUOLyhyA3R34/QVPiwSM4MQTWKPUSjts70aM8CymTAGzbCsU4dDO4vFVDRsojvN+FEu3Gqt
 avtY4ihud1lE5Z8SMScw1YennvZCY6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 15:29:16 +0000, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      https://git.kernel.org/brgl/c/c6c2fea2238e232740243d09e2d397221f5c622f
[2/2] pinctrl: qcom: Add Halliday pinctrl driver
      https://git.kernel.org/brgl/c/aaea5cc6735dc7744aff4cc02ea5b6db9db05c17

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
