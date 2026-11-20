Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203318;
	b=pyLXO7WaIB3LF2/qExwZmhNhst5muIt3jnb12dSdJMDhZvHuiC/KFel+QxOdSWRaY9Ze
	 qnzPbQZUHYY/qrEir9SOS4Go3rgvMaPPnrJxajuwOXfsGrzZEylLB3FKc3bAYqh/H3M5V
	 T8gYWfVBUr8yuZ0f3TqN2gDE3QGrKHQY74vIISHKYePG3w3BJNmEC4vAsEMM6hwjUOP6c
	 y21tPA5ZTy3GCoeH/6JghCWR/C68BtC1hXRdETNi4T2UBqA9GbzpPocW5M46gyEhEJHnV
	 Wffc304FZUC0G/PYOGM09zBUcn5Tbu3F5dwR6Vf+7M0GMeBe9ljMkMxnlyUZGrZew8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
	b=vFhzuJmPmn0d6VyHoWkAFSIwsLrZnlDL+CO81VaPvwIA8vJd54+Fmh8eMpkWr3rr8vpO
	 Yn4rFFJIBk3JsG4LjMnh2DhYIybS3+S7H2WzgcwJeey33wmlRxEZ0SsWKzh6YCyYI8kKG
	 D5yIFRhjIGwLh/puK1xr3XKVL+DEbv/G0Ctzp2O7nttd1NVO12nBCoADaV2z2Cg2qUSfK
	 +avGdI4UxxbwOrBY9ic5Roj6LQAsRztecWIfEQ56QIhLpSpDS0jIY2ZEn+ui18y/YiSPt
	 6+fy97z0Dg5gvPjleuQ6WuS3/St9rUK9KnnRGQeVD64mR++0AR1k53G2X44Dh2qk/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGCQrKt4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGiyszoh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BC60A261C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97BC60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGCQrKt4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGiyszoh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI1ge21507191
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=; b=ZGCQrKt4/uDsOq/M
	Vh5HlJGRDrVRvRCUjnew32SQ+6unuKLVLWVCbzNU2vQPxZL9Wm5rppBZcTYj4kAw
	pWEA55PcMtn4a/YXSD795fEqNHeA7an3iPnHOnMRKn6bkGrHZZ84HKRc8Ym2Pgyi
	wzgdka2FkqmXSFmUghHJTdnSxWFHiFO/AnOiQUUAg0gZYASxiqcrAyZS11hr5UgQ
	J4uOMEPopbBPeobs+5kJU36PC8r11QztOI7yoQqgOQ0DE2O4fbLLBTeADN5frTl+
	uLMJGN/JenDwGsuAqLqynsvJgXKNnmq6lZDBNkmsrrAHWT1lD2z7qcBtB0sciOST
	hIH2VA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u4frd76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so273132285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203313; x=1795808113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=JGiyszohZM1xaaC4b1ExSiKsSsXAFefRwSSth91DSBCZQTSS1EnR2AUyLQNYgs+CbB
         CfaUO9baTSVA7nBn/CocWR+IxujukyoqkRGQ8e64yI52l1LSsFYrYwzFRGd7CU85llsX
         JGu1UfSj+NvxfJLiihIkszI8CzfopMKSJV/NVb4mOzfC4DUUrfjlY9kTDDkVUnUsLLG8
         XPDPYH8GW51I3Fi2FSelCH405KSVUSOQdc/eX89lN7/uwqjtZvxJI3lJlfNT/0DVHI6h
         YkLHETC1sWqCd2EsZytVdofDr2wy6O8OlPCxdvA63PHbcdCTLmxjToXdZ3sO5gBKx9n9
         yBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203313; x=1795808113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=ip2LBwg6w1XgA0vgHpLi5UaCz6ujlw9NXuP0zktWY5iJrRNt4sTzBa3cq2DHs4UYPK
         FhWum4Ev/Vw96GuCXgmYwFrEydB701jRAfDFvSxWGALDV3VbD/OK6JxpPO+13f4jXfuy
         Mh4AVYOqy8TZEtgydPrMUzbCQJVX8CRQSQKRx3NydzhRKHqXyOXpt6V4TQk/NoujF10s
         eFBTPTQjed0lNqGYkGe+pkdZr4jN09tX8MzVjcxCc/ejSDa0cd/nXmqkGnD3lkbEmpuK
         VUG8X4jFUrHpJpCMU7CcFkJYbLQgbj6v7auSPbqQIrqu/khLfZXvkzDeWHrZcvASGNFN
         lqzg==
X-Forwarded-Encrypted: i=1; AL+hErFhEyLrwW1qqCB9O5G5PWP7js9vS2yHIBFmBJvwhbtPeoWi+bci4G8Z33bYvHipqzOcSx3FhQMTrEi9J5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fZ4IcKrYAjbNDCbAWj1HvfW26f85bdPhO5UAWV0Xb+j9vTvy0
	9nL2B6r7DtGnKpCtKMDL/ZFcA75YFTfcYmw051Q6t5lsPuDwJkaBuBPUfRVVIC0NxX4JL1plY6h
	2xLIq73oDdzgwJkGVsFJdEiEW4b0kqx8Jvyu+MNDhN3BTprsRdm3XGVJNiCT6GNF3720=
X-Gm-Gg: AYBFou2JHSVvasaOvgJPdzbFPDwPPwojwIzvtCosw8L3SeubhK7vjRE0qMl2KPymu2M
	CVsVvXxAeDa1s5fbE8CewaiTqykOcpTLbg0e8571zVLkH4tMwNahYAzMenHNWFPoJJz3fhMlSW6
	FyNlKJf3gjABiFnVeXudsu/8WzzRtobI0MsMA+883dxGMkFAn5+GZ6/JJBg6LVFTqQXBEN0lF4r
	8o/nu77hgTInugYpltsyqowXoiaGJeU+4NAesySr5HoM8VVFSxoHLPn80dcBr8lWcR3PrViFMgL
	rweaK/VV9+4fnUZR2yaz9QPcuzuUvs372HxCe9NcdD//HB9P5kLagKHjHUotlj0+PWUtZ8Lof3u
	aA32bWHAO3JC0oqlWDLutXAYwiBpm44wMEn6MIsu5Sa9xyrj/MysTaTO5bij0aox6Zz7huzwVyb
	6J
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629547185a.73.1795203313034;
        Fri, 20 Nov 2026 11:35:13 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629542985a.73.1795203312591;
        Fri, 20 Nov 2026 11:35:12 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:57 +0100
Subject: [PATCH v12 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
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
Message-Id: <20261120-qce-fix-self-tests-v12-4-b5a2a44bc5ae@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n/kwYOMR7eAiWhZVvnFhVSRXRzZNHQxPDtK0VW9Na1w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDl+exRoCxSgXKkfWo1bCLJugtHPQ5RgKsBU
 Be0CPNs2EaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w5pjD/9xLwdHyFbKZWUgw/HnEyN/cyMIR6cnngISMQfyrYIhTxHVhyu7G3jbdFCXrvo6Xbo4fJU
 YNbpr5A0on48pvyNXpDWo9JtW8kUcLJWvksQlkKST+7effTOzMF0Ui6ZyLqRTtZQYHxa4R9RIAp
 8zkWigacXyIU8baZeQ9EWfWg/tCaPNuHAmM38ZDZPY0fLijH76Ea+ZzhUqH4JjEe+zSEnTwgmhw
 fhzUYzldccvlzzuDTDFikgoISQOivBNtqYxILxuSYoQGjZk+UNXaP55LqULEetHuEtziC5vpeAg
 Nl3LT+qNGq/Efm7F26E3x9LU6nxDZ+0tivj8NHlmJvLYArtSJmT8XauIt0w3EJGGV5zjgyKJF8A
 VwpPA0A/6CP8F9FZEqj6UVst3wRQzpupfJvH+I5FgRKbUNmDaqTVnkkBp7sgOewZdpJZmh5PKHr
 pD/BsJPYbK9ApWc02RcyBQxcscjs79IBp7dlCDkTxMYWvpUj7x4CjC2FE2LQ27bcZmDzQ2qkvFg
 zuGNW0fmCQpgXmQRslszqJqX8niFlPG+FKVYkr5Iio5Am/XA/cDBsBUUt0gixdI5y1ypgKZy7FA
 ugk6NAxVBKf9ifvl9Jb49tvQnxae6et7ze74GaKPUwpfsgrqHEPVjDi6hMaDdefQ4b8eJ1k3gNx
 tSOU5E6c4KWxi+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VJBIDNPX c=1 sm=1 tr=0 ts=6b00a0f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bXRyqY7hdEzn4Bj5V1ry4HIoj6WpOIaz
X-Proofpoint-ORIG-GUID: bXRyqY7hdEzn4Bj5V1ry4HIoj6WpOIaz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX2m0AlpjqW+pU
 0S89GOse8bUJ4L70mjjR3BQkzotx923bX0x93Rzw5j0hDqcCKYtY/bV4AHxL9ADvMir/g7qZeHx
 XOfF1roueovU3C7YaY+M1sw6hUtyPO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX86Zzzj4o/upj
 yYgW9kp2GVHLysc+IHMOAc9eciUqZXPT8ZPtcWuBzwBxcriF2Yp2RyiCfMlnjE8n/czmDRggBxo
 5jz1+Xq0gBEKqQOD1vUq20y8aBsxizjdToprCCyq63j74fyhuWqOMrRmHf0YRy0ArSu3epL2j6y
 XFMDnqxqZJRMfCBi0D6n+TooKXKvq30RKq7C+ApwI2jsN5Gyp1AZvEkIyGnuXrHM/XyxVl/TWiJ
 dZj14u3k+6RqujpbjNY+Teo/6bPv8TAecYsWUzCXLaN+1qC+lghIJRhzdYLfJVH4sZ0IsyjMbna
 55FdImANStXeiveWRzTDNX2Zs0BVFaAMauHFIOcddZysVhHXbIzsz0jQ2NDCkDi5qaOOyvYYNub
 IbHu+A2gtUTGWKQaoDxqdobc/C+rB4glYJwthjuO791h6TcBGIkDOpZNp3E7VSxKaQ/Dxigxnk3
 k1ZflmZEyS+9aklAJ5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm v7 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c54bd79c30701ebe59c0e6ef3b43309926154bb3..2413ad6f4d4b02163ad880bd8ae0ca30b1aa7cbb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1135,6 +1135,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1306,7 +1307,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

