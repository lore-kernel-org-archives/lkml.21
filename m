Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550528;
	b=0u4z0/HCzF4vmsMSSr5NwLm3RY3UHTV65mq+f32f3SC4H7y9UJ/JwrTh/p9MsW2sbPg/
	 5CvMTH/FRfBadKbYfkYmCozgmEozNC4LGX9OeTK2QZBfGZqSqsoHY8xD2KiPDaUbdjj7Z
	 aESH0pcIgtkyh42/QaTyfiYUfuxcBVIm5BoaeP68JLqi1Vv/sR6+ea5/gLn0Q7O6MJ9BQ
	 RJxdc73REmAKezAWAmqCBuheIJzXQoT1YKcTAeMrGMMUx+FiPAtjX5bZBFBi39vG+pvnd
	 Jy4HNmlh/maWR6U22VhdrfvCneTTRTjwAqFBD4Trh20xHjdyJMSkxGKoDAV1LvaiIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
	b=oNhmhTf3/AfX42vRLP+1nNpG3qvk2PtT5hSEzZazZeV1wOCww6tocvk0we/E2yz8ZNcD
	 b3nMP7UZiff3rsGj8q6hxBTKRiDv24sj/BwkOENIjKk7WrVqV4Lwm0RKR0tO2N8Yc1KiD
	 gIX1kTLX28Brxq/P6K0YXqxYNigWtMDm7YHiylcJ11TMO6F6lzSRBFF4BPgvzL6LIw/qq
	 uKXCULVaEodFn2hFzcL+I9nL4t3p1QsNqkcSh4KJY2/YIfDVS0o5JlP+yXhRVBAdWfufv
	 1c1x+PPfJU8kPAHRvLGyKe7yeJJI9NWQsKw3JfHXN32S5Ywr+il5NKBxiof4KLxJ3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/nV7wy1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjXYOKbw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52C606A685
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C52C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/nV7wy1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjXYOKbw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLBsT1722529
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=; b=h/nV7wy1SJGXgXHN
	EuxfE25TSOCIoDL/UIXjrBt3eNdKOtx5SYPV8+tdeM+RVBU8wddGeb2Y8ieWrcBM
	ghdeh8+fj3cSvmS42qHakSK+s6tUAPW3WqlD27+Qs05JjMAzDC70Toc9wAnPURqA
	XRgE5hz84tfTvE/93Kp53pFcSa5LWLmzhFgA/EY4eTLmvMWyVt8xAym8KiLqSrhc
	BKHJKe4zPPJHXv8EartjklKRMoG+fXIEVA4iOxct6Zm4FI3E961ZO+X1G6rKxE/o
	Ep/YEPvORx8fgz8LAgBIkjOh8D9uNsbl6FkwJWuJ6h6G6OvXtkfx/OFEj5W8I2Uj
	3JoYQA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns84s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso221797137.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550526; x=1796155326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
        b=SjXYOKbw3pjdhnhu0SK8kg1FwEiSboPEz3MtyZjVjAEaeTRjeQVEqojV0rB/pxhqkn
         VbKXjtiV6WOfLc7BPAs68PUV7nN0bmJRquCRTI0b7UuC+8QfyeXVmb/xJk4gbsZQx2ZD
         9SjgK5jEmNG2Y5124CjhV8a0uI653IRNcouGTprpK9uGrBWCewc8mwUU1kh+3692VzJe
         8q7ZpqjO2VzbR6Ets7zcTXTV547ezbGaXNUJ3eEgAZNzHSMbTNv4moHYcHfwdXDnk7IX
         ktI/Km7zeZyauni9sp8xsaN6fEGI2J7x7mwxudBB7wHavVc5u4DjYI/iQggxFJ0oahRL
         UfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550526; x=1796155326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
        b=dTvya0fLtcKyTXQ5OkHwx4TLtPyVnie3FXYJZHJ6K18yjEJaLfqNhhFq3/alhNaTXL
         wZVXK/R9H5sBeaQnH6Wc979aV88IbKQZ3E6IrnzGvA+FRzXRmuhndPoTZ7pqZUpzA+2m
         qa9KWTx8U1qTgn4d6aCki+cEQThy5aoCMeOgZy9K9OUk5L/fG+xm61V8CVPG1gmtf7V6
         WYwnZH613EKfTFtmL/lhPL9ljbIli498R7izKgzo2IMY8JbKRDt8/ge9I5WNs/N0WG+9
         W3NVMHkHcuCyTkOnUpYUV8c7nlGf96akSWL4HIfIIoQmMQU0HFU9pEbNZBoo6x5a9Hhj
         lYgg==
X-Forwarded-Encrypted: i=1; AL+hErGmzFVUa3UVw2SCFzzbSMPNTDHblbaitmdPa8yuQ5Furjb0I8QfwRX80GWehuPnTQT47lBliwJLGgYytO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cbzpDif3jDhHpkCvaoAovpbJnYpWbh4HYrHjoesTcdFClb1JP
	yNbWFoltlAC0XVDcAF88pwMq9b6iu9OysPMu3fNCNx1SZOm0r/bl7YuyGoi/U0a9u5Hn3UjkI7g
	U1D4q+uPQWh4dbMlNUKQNj6FyKaMu8Y0es0l47Ta75cgWbfPYXPzt7nIZ3Drqz/yCIzA=
X-Gm-Gg: AZFdTZfFuDfeyg58Y51yMvpXsV+3igSBG9ZP0KX0lbfefLl9/NgQt9RhdSMfhmdNy1G
	VOnjhzbmWiEKZ9Jq8budPyGFxWZoKBcY3fs4sWxMpByQk0AmkXttkIwEtvx41/UAs+xb5KHt7Z/
	C22q5tb+vHFCbu08t94fQzPzbKQl0g7wMDKbYVtyq6AeUtbIjDJE309R8ZzlXHHEaF5pP1xSVji
	ESBEjNtTjN/fXgnTQKsGh960SWak583tmwIeB172D3e4p/G6/WFuonXBN/zsx4T83nOpL3u2A+8
	paN4RnGggOPiRfBRIIVMJApCCbPMUw4U51UDghEi3eocWXatfYCTTQp1lYixRtagkC4reRh798Q
	bOilmHhAVPvRIbuUF5IsNn6UICklF4NHcAN4TW0k8on8hUxr/Hlz+OCGQF3GaXiX8UELesQd481
	MvoJO45lM=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr11460366e0c.4.1795550525486;
        Tue, 24 Nov 2026 12:02:05 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr11460306e0c.4.1795550524926;
        Tue, 24 Nov 2026 12:02:04 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:37 +0100
Subject: [PATCH RFC DNM 08/15] thunderbolt: nhi: Add pre_switch_suspend
 hook
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-8-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2074;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=w2JBeR9pVQUt5n+Bi6UCt4e2sRq72QDCU1+mYKjh9Fc=;
 b=1ZJEU9y0SMY1cHPgacE5QRcg2RFK1C5T3lOj0EsuHjb3tspsLLFfsvGcEcm6vOxGUnoYmds7Q
 l4V6QgK24ySATiNkZnm4w24s3GDOT/qMj3xzNgD+0XUEznWnLvsHNfs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: kl_8RyveFzgERcPToz590vpsmJeDkXZ6
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ed3e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wKcZSsCu4wochMfWqzUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX+SD9nP9Qct7w
 lyQ8KdOEJFgluLY2/hXI9HUTPHWZ4HrTS1JX4tqzp14lJf6jfNjigStAz3J9gevhJ5EGqVXqz1C
 lXRaJB0mHM9haAkkHSxl2PL/AWpuxfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX+/oeewBOI29q
 gNTDoPfB4cbC4ug3kmqwzbosyErxGEhIv1mZs5TaqPlqDsVUFSb53EDuBlAvBMJRrwQ5j8gcTnf
 x9iUo/2EeFJmL/re80Dq8H8gYPyAaW3GYlfLaxkU0pbUsUuRadd1y3eNSTDAehSikxFuW3/oCyO
 i9mUYoN1NqWwO3GiSAmcwCk6AHY0tDMN1MHSxvNTmcxPyoRVRrgGI/1ywuPaujbYhnl4OrgKqqv
 O2bBzrDBB5wnz4TgRDQmoT2HvbhihFDy2bc/VgKAtAiZo4Js82rJI/3WqvzbG2bEntt5xQYvWyx
 /09oanDJtcoEzYUObvrBLQyeuUPN2BcS0ik1v4z9rYAufFKEt9udYh1H4FqDZx+SnGZt01V41wR
 EsH2TfM+jfAZdssCLvCb9oLQltRXJ0UL02out3Fe1JdxQ1o+IrjOygEBgHfjLrobfMazPLiE+wu
 TsAtYqFPh5juN7jADRA==
X-Proofpoint-ORIG-GUID: kl_8RyveFzgERcPToz590vpsmJeDkXZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The Qualcomm router firmware requires a three-way handshake during its
suspend routines as the OS writes the SLP bit to a connected device.

Add a hook right beforehand to allow synchronizing right as it happens.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.h    | 2 ++
 drivers/thunderbolt/switch.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 71f750451aacae6ca2f8cb37bd8ae7fc5a029818..9bafb84cf60adbdee1f1f083732719e951b88c20 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -53,6 +53,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @release_ring_irq: NHI specific interrupt release hook
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
+ * @post_switch_suspend: NHI specific hook to call before suspending a switch
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -68,6 +69,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
+	void (*pre_switch_suspend)(struct tb_nhi *nhi);
 };
 
 /*
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f89064b3ed9c2b8beb8d5f0398640f11..4908c8b0e580a500acf9cac000e66a25e2102d47 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3660,6 +3660,7 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
  */
 void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	unsigned int flags = 0;
 	struct tb_port *port;
 	int err;
@@ -3693,6 +3694,9 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 
 	tb_switch_set_wake(sw, flags, runtime);
 
+	if (nhi->ops->pre_switch_suspend)
+		nhi->ops->pre_switch_suspend(nhi);
+
 	if (tb_switch_is_usb4(sw))
 		usb4_switch_set_sleep(sw);
 	else

-- 
2.55.0

