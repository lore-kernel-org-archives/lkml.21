Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710965;
	b=OIzcm70povlFLRyqr1FqLrJ1XpHlrthfyDHB6lZpRb5IQBDL1qOUjl89BwLXLS1MJ6dX
	 NNc19ZFIdH3Hk8EskYHLKM3Zr3cnMUIjvEZimN6jPzdm/PzPV6QFGZJU6ulawdostWRf2
	 DFm2cmT2n781TlsmHIe8ciaLKsOfU+dBJ7XL53t4t1X75V8bLDeJuiA0LOg3lzlM5mAVz
	 zhaS5FeMYEiie3m/PxFbiQur49PuShX577vwNkxwsi0EUwd3VG0AKYxt3QYVI/Wma6CUE
	 BGAgNBQwLhECsyuPZfGsNvpqqq9hsn7KP9ErFN4EBfHH84sSNx+N0ng61TjMhhrOlKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uISJzFxV0O31D/gpj/FTdd8YZSexVP2lB3q9flFxsSs=;
	b=14wXqNuDZm7xOyKGQD4qVbe5st73JlymKBf03Om3CfmyuTmEDO3sd26t/cPr+OdXgbv9
	 wakS3VJWHhY0tipOck5X/4evscwGBd5YQxTR09tZAYJbGM6wraVYVV/ZHDKUiH6zi3LBD
	 YLluhWyCVhMjKyKCXxDPbr2IqUAezi6Hxj0VXaFtwCFeUBy6Kp4hFiHVD/scBgU6XlOso
	 7XZi9y40sDDvGVizYT2pc4xYvRo8F2CSqYlD719clIHAgTpRGxh7yIe5+Wk7sWp1w+9sG
	 fEqbNU0Eaa1IUDxEVXvKesOu301/dO81lU4rVzRnLgqpzWnPpbGhMkNAo8YtUEU4IOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKLKSeR9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSkcXtol;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF68606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF68606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKLKSeR9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSkcXtol
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu5hx4049091
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uISJzFxV0O31D/gpj/FTdd
	8YZSexVP2lB3q9flFxsSs=; b=mKLKSeR9sAN+KL3+WuKi6yV3MZIFforh8qB5i/
	K7c/s/e2S0RmmPQh9N8A9xEY+SL2FshepmZx3NwU/X0lYU9yqg4thxPBlqNdJhLG
	BEDgVKvW+xGloWDanN1JnM9vdVzHpAle9JcusrGBkfUYlr2+roPG0AvdBb3Lx7Vz
	cQ2WOzFah88bmLY5CW+mciylc2syM2byDgN7g8hWkPEu7VLmKtLiyH/NQH7TjKTQ
	V7KRS6cUAoPfmIZb8TukE16+O0MaNr8Iw0R0j3tBg0d3V25d2hUgQQ6TkUBLLwuT
	RK9yLHNpmRv5PrqX/YpLqgJ0n8KZLxOxuKXmDDExZuQCiMdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rj6sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:36:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386c3309469so3120363eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795710963; x=1796315763; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uISJzFxV0O31D/gpj/FTdd8YZSexVP2lB3q9flFxsSs=;
        b=FSkcXtol4xHJN0Bn2xrwAX5ZbVv69OPTcpK4Nx7WKmP2PCCbAvzGI+0EOoEci9ByAK
         YPf6xWXvTbka10p2SsR3YbMXLYtWPe/0S/vo73X3xP/ev8u7xexXwy/ArlJG0Eg0C98A
         MaiMO/+EE/qsRY/Y2ZgUKdsJDpJrospiwLONRIM5culAXZ9sXwdjEOQtTZqE4PjnAgfs
         IZiG10z5wQfP2Mgdhh6hH+eWsASAqxmot4h7TF+11VjwKKBqWmwih6+oxkPaLuPyHwOx
         fB4fl0czS52pG4oe+2YX23Os1t3X0+NWD/1W7KazJuQNTyJk0h0VdAmG9Q19uwlZh/n8
         PLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710963; x=1796315763;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uISJzFxV0O31D/gpj/FTdd8YZSexVP2lB3q9flFxsSs=;
        b=HCH7rZXQLjOH99Hhef13JaSonFDTgwqn4KaRQAJYBPr7QL8yLYD8kgZIKfIJTo8vih
         ImiKTaJdUn0dM/Yzo6FhJ/8Ff5mkUCOEbL7Tqew0VtENNk84ledeD8drjm4tMdAcESQv
         7nkSVrfrLNwTPgnN1HmrLanMyTRcm8GeNPaCklKiWz5i//6/N1TTfOZPEZt1z6yFgJY1
         tEJXW661tGkxFbsykx80thOC8YuBPEsw6lT5KYBlkUsNrub73n1dQ1rBiP7EihLMYuQC
         k7RXOVRGCR7ATbkblNclh9oNiL5Z6D6amhdOnNx2/91tGZyM8DzUdrsI527B84x5hV4W
         ZDuw==
X-Forwarded-Encrypted: i=1; AL+hErHMk4Cnf/5ZGLX7hMGI5yztg+CWGv2cEOjlkL6c4YRcpiYTeOoGeY8KCVXwtsknhnYSaF6K/mp5rORzbqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y04l/wnWcf7vosxl3Im+G8GAi0bMq+a6+lwgMSlJXBV0+jfZu
	SeSf5LmFBOPet1hqS4LcHk+IUBLzaHXBAqBVF3SUxcWZ/OlZmOX4RXZM4btGdob387iXKkoV1pZ
	hcfSWSrLBH7UOFlZx2etOjhm/34fnERBiqqSo3f5hh6XEG2bsMsgyY7QoeplMgFABb2E=
X-Gm-Gg: AZFdTZfvpxyLfDOpfOdkF1rdxprnIJpn2Xery9mISe6Fkmp+vEXyLZkKag0j47tpGLO
	K2SXy3aC5Dwd3bJhrlHVQi+dsvrlEzND1Ln8ur81NzMRxDsoihE3MwFSRPGq9CLHx66rL/9ttB5
	8ye7dnrFJpaG2C7mgr3hFd65Iz4fB5F2RCanRy0EfiIOrJ5O2DBINkBT5fTZldhueCuNxB8mDjI
	LuDFv/5H1+Xeso3fy3UbvW0CPbWi+0PAm4dxJ+IC23aGnKGmyxWdfzRq9rY6xszDWix/TlRQDQP
	BF27M0B659Ud9OJPNP+8tzKfOnlwAJJpc+J+k/w+Df5I0O7qkOO6/auoN+WtIsS5qHh+EY1brqp
	W4Pyrc6h4jSY+Tw4IgorL2WgWN4gW5KV+2YrtI1ySNO1789KV1+ZJ6Krez9vX9br7rV6zBdplGs
	dCKgnPjviiuVhFOnzRJySjca6PGJua0+Xi/zHqmHgcydA=
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr16389443eec.7.1795710962843;
        Thu, 26 Nov 2026 08:36:02 -0800 (PST)
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr16389426eec.7.1795710962325;
        Thu, 26 Nov 2026 08:36:02 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm72474910eec.21.2026.11.26.08.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:36:01 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 22:05:56 +0530
Subject: [PATCH v2] usb: dwc3: qcom: Add support to skip phy management by
 USB core
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
Message-Id: <20261126-xhci-skip-phy-init-v2-v2-1-004f9c5597e5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOtfCGsC/yXMQQrCMBBG4auUWTuQjjSIVxEXJh3NrxBDppZK6
 d2NuvwW761kWqFGx26lqjMMz9wgu45iuuSbMsZmEie+78XzkiLYHihc0puRMfEs7EcX9sPgDsE
 Fam2pesXy+57Of9sr3DVO3xlt2weVmU5geQAAAA==
X-Change-ID: 20261126-xhci-skip-phy-init-v2-6d0b35508b0b
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795710959; l=4629;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=U1VV7d+fhg7DNP43HmWOjbdH2R3wn//2Gj++GTx/bJI=;
 b=nX6d37aJ4dvKjXnb8JtWn8BI2KdslB/Oe6eVYpSeKrWAnXe37oPjwNP9swr3Lnr3dEbaZz61g
 xR1LS4aWP+aBxJmWze/3ktaHoYBOxw4KfjymGS4mclmMAEVPa/5bIyE
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NSBTYWx0ZWRfX6alsvlhyYviK
 Iwze7UkhRdhLPN4cbBJmCsmEEMA+o4nWcgeUsA9NoPuY96d481zSOOOsRLOgO2g8oeDB8bazu+2
 qzAzKqOhPll4WwB/V441R8ovfsFZE1II6keLgGBW579jcNeNCk7vmw7bf3AePvJw1D3Dn5J2V04
 Y6E5zK4bs7cPoEwCgRtt0Bu640yGcvG3KiyxYGtoNeQEJeSPUgvyq9+DIKGpxgO8XHAguIFSC7B
 pPPUiGGWHJDuuad70p1nSyZSVBdYUsFus4zzMfF4tKIgM+I/GEfGd1ZKfcn3QzMstiiKc+BBC0g
 RE5mgiuPBn5mNAR5fO/1bilY4VVWwFwADuac5rjcw/M7EdPd0yN8yCN7leLOyDKgBrGK7LGMSWp
 5PSY5Qe/HA6e6yy4S8U6fpzWJZMptpLaeINf7mlMIEScY6L35eWXhaGpzSPY1ZYDAQIHohG0lqM
 AcvegRThb5PR49YlpQg==
X-Proofpoint-GUID: 49NvSOhGMp5It1_7sT4ZLoaUkiyq0_WK
X-Proofpoint-ORIG-GUID: 49NvSOhGMp5It1_7sT4ZLoaUkiyq0_WK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NSBTYWx0ZWRfX4ZLX3M1JayQr
 gENnrEOMRuOl2ogpV0M/C9M3Zf5MywJnM50an485w2knym7CwGJXMaQNRyaaNzQaU9qhdlfFb3+
 v1TDxVTmLoiLdorOCyghw1Yjr3CiWhk=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b085ff3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=FBhBF43qowX6Y76zbycA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260065

DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
exit is done only when roothub is being destroyed. Due to this, during
system suspend in host mode, although phy_exit is done by DWC3 core, the
init_count on phy is never down to zero since HCD core also did an init.
consequently causing phy's exit routine to not be called. Hence, add
support to skip phy management by USB core.

Some Exynos platforms still do rely on USB core for phy_calibrate calls,
hence disable USB core management for Qualcomm platforms only.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Initially, a patch was sent adding software_node properties [1]. But it
was causing a bootup issue as mentioned in [2]. Hence a revert was sent
to fix it [3]. This patch uses a different approach as opposed to adding
sofware node properties and was tested on sm8750 mtp.

Changes in v2:
- Rebased on top of Thinh's latest patch series [4]
- Removed Thinh's ACK since code changes are different in this version

Link to v1:
https://lore.kernel.org/all/20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool/
[3]: https://lore.kernel.org/all/20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com/
[4]: https://lore.kernel.org/all/cover.1795559405.git.Thinh.Nguyen@synopsys.com/
---
 drivers/usb/dwc3/core.h      | 3 +++
 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
 drivers/usb/dwc3/host.c      | 5 ++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d103a637a4f7..9b9714fdba9e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1139,6 +1139,7 @@ struct dwc3_glue_ops {
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  * @needs_full_reinit: set to indicate the core may lose power and need full
  *			initialization during system pm
+ * @skip_phy_init: set to skip xHCI PHY initialization on host init
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1408,6 +1409,8 @@ struct dwc3 {
 		unsigned		usb2_gadget_lpm_disable:1;
 		unsigned		needs_full_reinit:1;
 
+		unsigned		skip_phy_init:1;
+
 		unsigned		disable_scramble_quirk:1;
 		unsigned		u2exit_lfps_quirk:1;
 		unsigned		u2ss_inp3_quirk:1;
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ef38308023aa..3fe2e0fb3eb7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -636,6 +636,12 @@ static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
 
+static void dwc3_qcom_fixup_properties(struct dwc3 *dwc,
+				       struct dwc3_properties *props)
+{
+	props->skip_phy_init = true;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -745,6 +751,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.dwc = &qcom->dwc;
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
+	probe_data.fixup_properties = dwc3_qcom_fixup_properties;
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..3fb8be8be590 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -174,6 +174,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->skip_phy_init)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.

---
base-commit: a431ab75251f0ae5b7019efe7221b851716c2c3c
change-id: 20261126-xhci-skip-phy-init-v2-6d0b35508b0b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

