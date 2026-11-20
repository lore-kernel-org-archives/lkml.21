Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203314;
	b=HTEvTeWcw7rZBm1xfDjiGLu1lFlamng9DgdN1P+3GsIB7Gv2v85465r204mcFkuIbPHw
	 ClWBwAV5oNqdgEMZ6/h5rPOcnD1vBHRQ5+Ay45zogPtx0Q9HJuYhLmFq3K7aXrkgf3na1
	 qygpfxGdph50AxjSCXA9un068LbrOjqMk/3p7Pdr2vtwVjvP0Ta6hHlBrJmq33oK9DJ8/
	 JRwEeTvQAwI+uowd1c1zAqDKd2fWfjVBmtLxAS6VUSTshCiAJoAzE8PSKjMWLVQ5aZlTE
	 jD0jYL8PbPIIbx8bn/OlP89oj9i483LEOb8URKrBDaFrh3MocK0d7pjY2qeGVKevHMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=;
	b=ETyv0aWXBwJ9Ddxo5u1UdoulwsTg8fib7fBzOy9lnheGLZpIL0Sad94L4d5HLUqmTJq4
	 y2ZOhT862KTxrybjS8QkCkbyjMqRpYN8nRs7HK7OUFOWThpZz4yxoZpqoLwxxyPkIVEtP
	 FmSJ+VKH0M3ryZqyG3y2BG81AYCxK8v7gq9tbSCmL69pqfL0IK1I0h2EXGHK9SBslbm4S
	 x8Fcv3qgZRQwfTrUIqOTODRDa3hcKHAuKl5YdoI/CKALM6obehsKGGfzhvw6e51nH9hX4
	 UjStVr1QKfmnXyqcT+CMz96nA73DjLO0KjNLC0Q/n8zHpuyFlsdj6M11yOig3S3CzgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bunohDY2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYqeJcr4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD71606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD71606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bunohDY2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYqeJcr4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfS57048794
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=; b=bunohDY2nP7QGQt8
	MdN7UOuaBn6wh93fUl7fK2J8gUn5UxlSie0LypcNEIB3aELjmGw19tpj1eQyw7H6
	KmXdTYtYTc2KTgSFYatJTypCvN6nWqjj6kAXVX8Y2crkkm/51nveBlE7mVP7vb1X
	otwZLyLmCBd5WBF/yPNeZO/rvRKO+vO3iRTIi51veWljFmO8NPlx7cIacKsO9ecY
	AfzslodA1dKqDChu6LGsFe4xj8wBKR4bV/iWarXx+lBbwM5L8mM0mpdmMM0JjsQJ
	C1qkrgVIcKkGhaiyP/IPb0wKbdVQDut41ka+9GRpqfoCmfdX2stBen0YrESTYXUI
	gHaqQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4j62w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2c5f10ddso26315161cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203309; x=1795808109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=;
        b=PYqeJcr4icoE5OrYRjxKV1aq+LE5HWPyiPlv3GuZRBAOV6WBwn90G4UkIqFxOSeWq7
         YaTUyS6Kd/6EYVqsUdmaUs+K9n0jtOBQziN8rqZsnsphX/xKXQqYfKyLWh6HLGO4k6M5
         xsQkgntDg0/CYZKP5bv6P7fDpc1wfImp/j5sk8vxKukFvN3Q4PueD5GOcE2QivewLVs/
         MIvMCq392Sml0OvS1LX4xuH3AKb0WIdErhecD+OpatQsOhCB4hbCEi/hZZ4SQfbaE3fB
         HdGRt9QAriRcxGbwmsgjv2KAuG6pPCovI8kA3KIcj8mbmK31yylTLp/uwxBtXOo/h72V
         5erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203309; x=1795808109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=;
        b=LCY9UYxqu/9mMgmXVdZoZqBJsMohzZTjD70AlODc1YiLc8rsuyk+9ZCkBoDXq5w+wu
         YzVwcpfxE8HP6tZqt5e0WOLn55oDylBOgT5bOliZtAq9m7YHYowAykSOgt7S0BqSbhRp
         eZM7j7zIWewHxK++CgX9V2iXn3gvfd7730CIDE/tC3tK/xAAQbnXzus/D0wXG/Xk0aCp
         9UYiynN9Z1xJI6ke11JvxdebD/SjIOEAgmXEpxPSr1dp/bnRjsvpxuSPfb+8yT8jBuml
         eE5SMoNRchHu96oSZgAUHayd8OEQ/sT786b9mKye95R+NkbVmviG70IFH4y+CHZvL29n
         Csew==
X-Forwarded-Encrypted: i=1; AL+hErEwT1REx5jt5XYoINbj6HU5a0mocAeEB6ZF62phtV5HS95nHls8mdTOao5u5QFR37RbsFnsl7cz0BmJlsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rGPuQCjAzgtLdbwleSyDDvGBTY8SkR7s3UkTFP3HfEjZCWlKg
	8/kmFVYDE5G6xgBWImfWNWp3wukTiOTo1iAOlAO+B6KBJf4aPdaXq4iCPtRYKInv7SjbAVyDCim
	xoW2NB4y9MGUns23PkIzIPJAlRdK0A1tlTRjdstbxHSj+jgwTw1SGwbvdza7GG6STQJ8=
X-Gm-Gg: AYBFou1obb8US0hyhOLI0FtJD4MvXb3H+WnAzJDQK4sMieOYhx6koI9iP8QLnr9vdto
	PJHk7/nA51TKE5FmEoOVb9tVlFeGyAfq8n7Vc/AsLyy03JF6x2xh4VPw90QRJZrLlov2KqtrA8s
	VZ1hKQ1+5tkhVgiRfmapCPUBQWKWdqup9xI/ZFgt/15kxqoe6T4h7Rpb6apB13AIoSlXwg5nZMn
	RBS2pKA4wH6Ac2xB57hLgZq6+n7nLkXdGQH0wZiojDPScbl/rOYdeO/VT0IZMZupsvkuezo6glk
	YCVvtmUZbqio3K5ssenSYFsnivS7RnWjLan33nLVEH5rTSDg1x91hGlol+qltPEOF9TexRcenjw
	xL4mm/sFVlHQN0s5/TR0JcnXlCEN/ZJIafru96/ZkT4JNCPnhGmirKbE1JztjZOakcMgP4rqmle
	r4
X-Received: by 2002:ac8:5e12:0:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d769332b5mr82070791cf.10.1795203309439;
        Fri, 20 Nov 2026 11:35:09 -0800 (PST)
X-Received: by 2002:ac8:5e12:0:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d769332b5mr82070351cf.10.1795203308921;
        Fri, 20 Nov 2026 11:35:08 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:55 +0100
Subject: [PATCH v12 2/4] soc: qcom: add core driver for the Qualcomm Crypto
 Engine
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
Message-Id: <20261120-qce-fix-self-tests-v12-2-b5a2a44bc5ae@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4974;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=h8wi3gHoBcPSHO6wVsk4xV1kjaXiDYSNLUgf+OIBeBY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDlgNZLwclqLDXVFh4rE36Y4UBNK6xtXQ2Ur
 9pXyKFIc+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w4jkEACINxuQoQ84aNZnezFZ+3ACAHlC1PZlk64EgwmcmPiKwsx7tuGA2iwlevgoP7nKKsQXqDK
 MKvkQ8UK7SeYMgitOufImx1yHB1/2O4hPfdXwYiai8bX1rH/dnoUD9pzIevaMl2kMvXX5vweBFt
 c+9ehiQid6AxrSnu0VEIvJYUvMBVP6+jboR7pgNZvm+bNdg8lF4D82Bok2gltGH6HgnFVxW428I
 gWmQbs3G0U2Wie4I6NhUIeExzKS2NOjlMRVoHgApS68npU4Ypfh5CzLJ4zGoU3tLI5LLiOw1pMO
 lisfnGTUMaXIwpbCeKg23pTFLsA2ovJLiiPIz6zqyePeaqJjNg0JAtrjdLOJP0XA6U2hyQPVIEN
 V9R4CTp9hTReJsMEMwCbv79uSBa5INLHWsrMvv4sVMvemsiFUQlaEE7jp6nXJxdoeoxLv/kfqXo
 is3R2QJhMd75OPuwox3XCKyve64bt5X3MF7SmSCZU9DF6OpcMXcCWEkGUPMHkKB5D4XmPKSoZJ3
 J/bqJCPk1BVqc3HbRYUqeZ9NtoLugpjIakHnhDys0jeRmr405rwl0zsbRWmoD2crpzvSi4O7Twa
 cIVX6xAZ2W+rMFEiuL8gl13eQ612hW9rM5i0STWmH9KNjenJXqEb9GV59hZCfwfN3/isR3Fyd4J
 wcmsGJ69ZwnY4Aw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OMTQsJGUR5kaUuS8aLYgSMp1D-jQvhOI
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00a0ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX8FaAY8zq6KuI
 F8Mh1GWwIyrdNW/UbHMeX+PmV6hAkAi/s77kRv4W+fekAl3CtoKIsYM5jFWG8xGubusdjfuK+/+
 G1r1E/I8/8/2VUH+HjUFjtC0xGabHTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXykUPZsMxCyRD
 iF2+mDbzqR1P8xiRreV1lahYzCiTqp/fGqtCw/Fcg9uAtn4OrG+QlHSlCNt7sC9k3QQrcQejKB7
 U7tQYB7zIdZlCyUD7LcL95l4791HQ1B+4rGnCU/N8Pjc8j/dDkb2lBGO38vVOgPdbQkhZzEfTCc
 CG3fEPBj7pVsceseB2fvoirJjF07vwIhIdcvVW69aXWqAy0+5PAdrTvLsmnG+Yu8G09vE2tteYN
 AP1Jf+SoTSahPz7E93v0J9Om+icqM1dPqVtZVDUiJsREsMWbLHITnSRwq0TNqxIkB3PPHHcRqsS
 FP0ek9LeJV8CJSt0HgXXO4wf2b4e57zqoIEmisp6W/5FHzO8nEDG61sQg4RaOCu12Jp4c1oVYhO
 1ncWsT9CxIT18YWGVgMplLeNaTZmmCy8Yn5RpVDUvauePt4Yd1IDOse4bVN+eCYo7bcBQIjEhf2
 l2dCYFS7LmPFCdcoNSA==
X-Proofpoint-GUID: OMTQsJGUR5kaUuS8aLYgSMp1D-jQvhOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b3e889e536da072ab89d3bb729804..67d54d5211ff21bae77cd8408fa47af630060949 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bddd6f0a583673047067b1f0be725b8bb5d860de..9ef0f11d015852d1f599769074d761f1140c08e9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..1f249a22e8366e8dac3cb9847f5f85e7f2144225
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (!auxdev)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

