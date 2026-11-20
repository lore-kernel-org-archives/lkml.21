Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203324;
	b=bfg7x9Gt4RR8pL4YajnlaFCu4UGkKVqJ8FG2xwXGlXpudGp1HHnpixNl3sCsSG07TxPe
	 hVxEHLLx+WJVYzLjG5KsIGTX6gBbKtuHpEpQrIoy43SMrZc0UOGzXfPIdoG4zckF6JRub
	 l1ZGaGnIW9cK4GaWJtUfVWprsEhZo86kXg32QvZIG/SBSmh4E6+Irv62MMjnlXEokGGHj
	 L8CQyCgXWgr1mwiJdq8vYz35MhY7qeYS/VaaSt+7ptBleoU+8EZbaGldQRy3TWkCazC8y
	 HPW8gwyXji8zxwJjO2REM+WseXtnlyB3Rmh7WLAtyTmtigGpkrJ3JQkKs/HmVMQzVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
	b=OAcBUa+l9+WjHOM82Qkl/plh66J+jX9BI8KAlcBaARMGOaE/0etQbyiHHnRDTOHMZd/j
	 oawGQg+hIBRvIOk0mzgDY2BlHhYmhfwHkMb7/aiNCI0t1mMCUkkvuVoA2UtKcIYIssTz3
	 ZbBx6YCONGgeJnlXQ8+e9F0Fif0Fa3FFNMAtcdfkrvZFNYgbGRpLSoNICmHTE1NY9cjt6
	 dcME8LbErYrNa0GHP+PH5dpxnU8/JqcaUdjbNKeSRSTWSm8UEU+z0dC91Y+QDzXS3Ofdt
	 ZseIVqUusSQWHt70fSNjyBujfZfqYgku4RiSxQUtjYYl7XZ0ipu/wr2aTM76IuKCztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LseF7q10;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f213JjZ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1DE60A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1DE60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LseF7q10;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f213JjZ8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGG8sP3831338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=; b=LseF7q10Yx0HSNMi
	Hv0eYmithUeK60i1eJxe2XOogdFyikPL7D+DwgwA6DsjXOrU77m1Sq2GMWfFHuQp
	ByoWaJiHBNquvMU3eU2AWBxkI0mUulbgYYXPIKgjXNkJnmFsqvczd1JxY2qDdj8o
	ZNe+DY0wf5UXI+qZI5ZivjQBdObZ9f+X3Loai6Pg/vfCK3NCGTbxwiFG3sZDhP1X
	aRHJPiBnvASughAXzUWfWojG4KIhbKf7i/il+gMeU2RNAnsh4jWfBIkRJ4IurQhg
	JS1QltTyvArU202mKhqgeV/PyIv1Sl3Tf/EWjRxwCxLSi0ubazge3bflzPwMiqTR
	NQvReA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwgw8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213659143bso24042146d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203311; x=1795808111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=f213JjZ8Ng57i6U8tU8MtyyO0Ei8RWBSDL7hEgAQrQ6r4X835zQHKMdSNTjLe3CryV
         RLz8/JvrMQGfP5DDmHPe72N7TjxEVXd1OBR9Nw988+P2wo+9vb9NYA7PL37o8adnzRqf
         iGnwR179Mp5fQaQjmUaGfLD/I2DGpo05XIB4OB9Dm+0uph7yyamKaC3o+oA2/yyIBAKy
         pnGQqsHEtBDlJajx4VMyHCtyIsCPXzDL+uXoBO9JSBBaol5MNGNe09AELq9J/jtRdvIc
         qSav4AO0MSeAD45F00HIds643rFqsu95pnFkRWyDTI+u2jQmxA8QEXRAtDpvvuTyb1cn
         ycBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203311; x=1795808111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=e3+aT40MSdBw/H9UORAv9FuquOfudU/h7lGP9dpSTGuMZ+h4sPOYM3/NXhArBIGlF/
         Pn2F+gYS4Q5oJZT9ITpTBnYrYAHVQyIxuJT+3RofFj895f3o/xUE1OvjPTbkSmBdoqwp
         P0LnB6cq52zUS1wguHCzPv9PreNulSdrFfYgZlA4dXgGF8QPQkLNjvRaBQU6qw/k1piO
         5w6OCO3oxbcmEWHEz2D2CSfgwEmZBNoZeLGH3d6PE6F3HhEABaH2maTDo1rK7XGyoCfV
         0y/rmBKi9omuEHT2ZkgARToxsyNI1+mUdu/LXs9O5+WMtGQsq8p32g4KHz6gexQpnSyh
         Q8Nw==
X-Forwarded-Encrypted: i=1; AL+hErG/Fg0WY9OGnmKVhfJBcWNzPqy1utMSIhuO7LK+VXiByQ6fB52hWMHTFl8NDVIAcbziI15U+DrvOZTec7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ggIx4YV3WbsSHWiQIHoaUpvlOSwYrRwJPQonCcxLk6PUhr3PA
	jjDNUos3ufylrrmlg2GTP0ejJ7VudHrWzfPLeTa5rWoHsCiINtthGSQNpBnX3qb9i8qJDIv31Ym
	yewE3LhUOj25etZf/mfdMk+3cAdUN3zHTltAkAvb5Na74Byx11G9AvyO9RWSRNMlP/Fw=
X-Gm-Gg: AYBFou1R7eTfHjywD5CqgcGT8yCvNYmr4+F3IEQHHYK+RyLASrAjnYTW3LYAZRIhZqy
	pajX25KyFM1dkeZEG4CdY6Swb2fI9HvQEQxRSUiw1tJX8qj+u36P7V+cDBLP7Vj0xreY7r2gt08
	aY6C1KDsdZmcrJWn4LoZBC8mZD28XmrPk1z43Fmgm4fJFrtVSGZKD60PJf4NrfRO8rxiMzgASu7
	B2hFBMcj9wHs6Ga97yzJ9AA7kpzzfdViYrD7ulhm4NMgOavhCwkkgN52gII81dpAwFhY4LsuNLv
	OAGJPSmjbbC9DIz0HAepyyoPNNXjDvyoPojscQpGekhWvjLG477SwiW8Q1X5dVgnBoC5lhj2nUp
	kYOVHOm75kCTQRBdZh6WXKuuQI6qAf/FcYpNlS0iRYEuFlEkZy9ocuj+citWGrbYRHdI2IWfLAW
	J9
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648560285a.73.1795203311203;
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648555585a.73.1795203310736;
        Fri, 20 Nov 2026 11:35:10 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:56 +0100
Subject: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3i3hdwFui/8ynH47JNYu7VqIYczjdvme1AY4IJcpfg0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDlAWUz7MHSnecvkIFD8fzhr78XWyGqTiqFp
 ba6dRuHuFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w0QGD/47iqPh0erUxpbyfM/v21ZsiKW4cVcUfs2IqyRlfHRc5SzLO0mtLaz5LB7MedcpOhE9QEY
 iflgwSDDEmM+mz7j7i8fLtuCvCgTI11KDajRLFCoc+NW3UsnLRJZnl0CabUcb79OXJmNgWxy8lG
 tqRyaC6eyWhVlmVFwHAT+1e1TVQyOJ07mGfcp3m6PCZDUrFmJQawmfJmSMyPX4BdNbli/3Qzav4
 r1tDg2hK1n4CmgArmOTwEdCb/Sxbo0xq40yX0HjnVhNmm0DKll6MKBTh0vUAFrWc7bzlfXG3K5f
 srXIiqYIEmjXsOEATKEjqdP2CSd150YKi1mq3/eHL3zmvyGjgWk835y1DmqtvjTH826EDdkG+3y
 6CeUHNdC78aMVYldot1iia8S75OikmhaAbzpOp6bLYaCaIwavutP7rCbHbc4H3quvZJOzCjTmaI
 lhXwZFMV8zRBNRHVNR8Dha1NCnJwc3Uyvs60+M7aLRV6zGhl3v0EFZRvkRipCFFRfXdX/q7TQ7G
 fLnpeW9nBP+a89DJz1CDFjhLDNLBqf/eu+ZWUiFMj8sIsa6cyCgOJSwS+bwETqDttqwbB3eTxdw
 zQe2biR8a+XHr4BrLfHLPZxeMBfmmIxJnZmkcaA68nG+y4GqFJY/lHzv0tMs2BM0hPlQke5goUh
 Ttbiw4m8FjdMLlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vcDy59LOLhPM700BCfu3nax1iK0svK5h
X-Proofpoint-GUID: vcDy59LOLhPM700BCfu3nax1iK0svK5h
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00a0ef cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXykjp5SZymmni
 bm0ypHWoI5AciemBLo5vqFxglMZnl8X3Isc+zGRLUYdAPkIWNnAPZDQnah+rFTy7MTEGDt0RZP/
 YUJ4Gk9PyGps9Vq8+3ff3GHoYcidfr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX0CZqsZcfcIbj
 RhUetUqd1TbIuwXslyiCmL9v/3prJATgx5OsjU4Nix5h6ECbfSfnvfnEqQRelDbV9rDfABOW+28
 N3CxlULx9UZ5sDkiesvBgU5fHABYuKcXhlnZoFBIWS2TETh0mQQ0CsqKwXdb8RnDL9j49KX61R8
 T1vyjjmjUcH98lyurb2qsbXg2PxCBvMu1enc7OXg4T5BRgO43QiIz5WaE077EmxYDL9eOnDK82u
 XGhh6AJh0U6tFZ3XEyMBSR4pYqoW2dOoplRXC1oHS+uCQoS5UziGnjNeo65pBYQ6gOlozFK/ErC
 sTl+PKGWVsKIF3TyAXIiz/rbTsiwsclt70ZFzvvU+pBPlbRBpqAbg0NSwzPXmzJzAV5vvtTYdT2
 8cDk5b1hkHhTmLB+GvCP7mqPw5cePQQD65pjLhGL0icZhrG0nc9R2TuvEMUCdhOCyBJkHGJJUFR
 1kAWORCKq0DTuj1ARug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm64 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a228883a216cf205181416ac2f95edf..1e0a7b81c738f62367df0ed59c005ea1500714cc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1553,6 +1553,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
@@ -1801,7 +1802,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

