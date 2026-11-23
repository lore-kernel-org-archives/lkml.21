Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425041;
	b=anfq5bF9ZdZxL5WC9MKjAH//ZfneXE3lJQCX6DQ19SqKWmt5Q0WGhGWNMakyF2S8/oZ3
	 PVRHGMUEkNrBBh2x27Z0nUfKfu+D6ISeSJYUcqjPALqZG6fJ6rkmJ/jVOYzEsxLD8kMq1
	 ylp0vC4BwSi/xU4bpBm0gGIOBI3N3j2+qMUxQI3VDzZMcRONrKmByXNIZ7mIcKn00fdV7
	 vL317hg+OqeYhUUecMsC9YXj+0gACidQwQVMnstVfX0c4pCdHLO40M/32ogAuk83xLnDV
	 D4601Yy2A9SOtNZ3By4eZbBVVku/fxjWL7KoYK3Q/1NIGp4xGgG9dcBOj3ZkwitTZCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uWN3Yvpy5H1Xwl/eUnB/hc7fSA1UbaIaF8+Ya0MATec=;
	b=BtNB3qiVhbSASxz9cxP3gbbkCI52RpmMknaowaW6bcojfB+VMaewM9FsAvOuqONjMxt2
	 9Zs8/hvTqAZSkd/hyZScHl+emhPqKlumyjRWTRcYd1Ntoz6Lu8wiIz82EVk4dtABf16FX
	 2iUCnA1myv6o9xyXepaqM3KfkC28mZwlA3brnmk4qsBWYv34PQ66ySkB2IK75mJbPq6Md
	 bm+wnfNQKDYk0b2//56HoYbdYiP6YEjhUgQznA4mrEAW/mZ58Dpy0sXkvH3AhqxF4x24H
	 jC4P/DgmvAQE+Qa893v3vA9VrOwrS2nkO1r8NShZcKFnG8EHJDR5VHvkTDHbV9IzkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF+nHPGg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5likdyX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF623606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF623606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF+nHPGg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5likdyX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN83lHe2366301
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uWN3Yvpy5H1
	Xwl/eUnB/hc7fSA1UbaIaF8+Ya0MATec=; b=XF+nHPGgZcQvz+F0P0uwj/YAXHk
	1ANFxBlXFoSkSNBdOJyYQjyRRucrkX8UzWGoHQM+4j8ZIW+QGYmS0S0Cw5B17/zK
	7eKqu7lRK409eddAfO6WNQaDlJjZUK6ki+aIvGFtTIdyJOfrQMAC/yGFn+7DnWSS
	+g4l/uJswVQasMplYuIq+6dN3m2tGk6JQi6h0tFwPew/Z1jmLMWDDGNdCDTJnDAU
	hSm8k/YactCebhL1Ia/NdmTGqQsbPU9OEJbjArkuFCaioBsP6sEDRyjYog7TthYJ
	wgTxI8q6AI0SK/GnHVDmCA6ZapoZA+2M7oqKkZDAC4LVLI+IGaiA3rEmHGg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7r854-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso5766858eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425038; x=1796029838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWN3Yvpy5H1Xwl/eUnB/hc7fSA1UbaIaF8+Ya0MATec=;
        b=A5likdyXQ3wJUm24F7K8hGy/Eotmi3MtaE+Xq/bHJuxPoymQJwvBomrqQFAuWgS1Vh
         w2+Z+VVsu6U5NX+qLnhowS1naHZUSNmlGukPD+YRZoQi7W1z9o9OTea0ZC+T7w0MzIhs
         rCIXbsSsAqTROBqjtOhdOVHocThTK+wfnsAoiIDqTvGkpO4LKX7XXu9Jstx/Y0Za0y2L
         wRMLkvHzyZEsln16H1OjbL/yPHwnDRZiYUuObD4EG82KW8aPHpovBMlazHx0BB4YUkUY
         njZaOLDQfAK1ZnqfeTgtiwmfj1ZOd/PLSArlwA5uDrn11Eu/M9uE3hJzwKMTrGUCGA+o
         a8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425038; x=1796029838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWN3Yvpy5H1Xwl/eUnB/hc7fSA1UbaIaF8+Ya0MATec=;
        b=jTeGgrTVb6bpfAdsQDSBAXM2Z3hh7IkJWbQOiUOT1AjL80DMqclX4+2GQM9XLvT1Lc
         ji7LREEy+MZBEGR+09fORHNnJL3K8qt7iHg0wi2ADw+nLQbN2k2z+mP1SGvriyeiMrpa
         Ev/xbS3t9LNkpLTB/crWzmtNSzEgLs9cQDUE47VBJtYwNkMdzGKG4TzhBM4Q0wdD615l
         cL3QP4FIdUS1DLb/z3R6w83rbOFAUPQdnXOBtuj2I08MYQHYeNp88mJyf5vmzOu3tdLn
         JM0v0RnG5FiiWHIulOqQbIoP0uJyLkC02V+6jOaJSkHtbvE5DpmhOMHEHiVL9VDPxtg8
         G5PQ==
X-Forwarded-Encrypted: i=1; AL+hErEDjR4NZcXSNAFGD5LB10PziEXQWBIX1b7ybWpTfcn9QNEnU0nPRqhkhp/GxHE1QWhZtk2uN8YSgZhdhNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QeAT3vK126ga9fjawdpqMWOHPWTlVmZQ5f44xLHakELOEf1SA
	i3f3s2no4NxrYHtKxGUBrfehYAnfGtaLeILfbKCabmYHoU028cyVpguaacV+bVFSADrtH/QsSes
	W96jyhb9g2+eq63JmXdUyItehrsOJRAtCIE303ekH3gXCmUqwcRyzMtd7tL7ARI58Koo=
X-Gm-Gg: AZFdTZeo6Hbd0eFjzXCfY7ockT3CZwzVmb8TNpwTwon9SjZo4sAPLyuCwO/F8wVts9w
	/oI6E7jyTu5pNq2vBXrPVHNN+aPk0cVR6Hlhxk/Bf711QE2UuK1k5CtHFsUt94O/hvNqySvgx1l
	WfkrJK3bjqYXwnHd8hPXN7jW+3PGR/OiIbhe0YMVZgK2nibPK1jK/CFuFxmdqCwHRZaHAakp30k
	oPS86bVT82sykfy0S8zMgFWn/E605prJo0YKqSAxA6EgMkKru1GrWAqZHUlvF/Xz5xQis8JRKGp
	QNjgozxxAymEhBilK5jRSiF1t4Tk55M2k6Q3aFCES7t59Fis2gr1RR02tAeo87z0WBAhJOF1rCN
	+5PldwqOccTnFsTuowsggZRf87uyjybRHunUfpNBdS/BSGDrjO4QHUvKIKWrNi+vzH4nxjNLa2K
	/ucQ==
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr11249457eec.6.1795425037651;
        Mon, 23 Nov 2026 01:10:37 -0800 (PST)
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr11249426eec.6.1795425037095;
        Mon, 23 Nov 2026 01:10:37 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:36 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO
Date: Mon, 23 Nov 2026 14:40:24 +0530
Message-ID: <20261123091024.2214918-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04030e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MKUcqzDF7wo3NqxITeYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX/TQVSOciUN5n
 u75cu9nwi09EmV93DyHtu60XxJyG0o7ABi5+hwmnFUdjr0pIkQtUAhi2plOO/uOJ99u8OzD5l1u
 WqJ5Wqcba1V/SkOn9vMOAVEX2EGt5ddNubzRjjaZXD/W026ft4N36+6ftXtrlbdpTHTWi8GuT39
 hQZEtjZa+3s7rSqN2UAU1PK9/9bpu5IlnrqhcA2d//Um08aBsZZ5d0r/pHivF1UhvgipTJI+QIt
 1X1RbKMcTqdLf/ib8lsrKwbhXdVwgolESJeL86n9pkvGaFeOR4MlNx7tGTlcKhw2urVUs+bxkWQ
 qu87k1aNqomP9T/3/VnOiUdrmnKZL9bkbjrTB4pNa1OS8gaYALuHW3UgbJG71Ym+kBGPZLkOzm4
 YuFs5VrXC/y94xXrb0xh6Dk8gPc1mulAGlBbCqvdSfEn7LXsSHliepujEYi9BjrC3s/YEoQ9WtG
 X6AXADl9GsuKicPVHMw==
X-Proofpoint-GUID: KE5E-i8EsrTfOKZf0yYTg-J6GRTQa2_y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX3YAFedWA8m/v
 RXUPNdKeSkvl7Si5pSc7Zp7sIbrikfy4TQ8dy/eQBcQkZsfqjXWPsK9PTcq6LXOXJY/y/msgxFQ
 rAWaX+kO8rFvQBZxceKL+ePD9K2KEmo=
X-Proofpoint-ORIG-GUID: KE5E-i8EsrTfOKZf0yYTg-J6GRTQa2_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230036

The CCGx chip has no HPI register exposing CC polarity, so there is
no way for the driver to report typec_cap.orientation_aware or call
typec_set_orientation() from UCSI status alone. On boards that wire
a sense line to the connector, pick it up via the orientation-gpios
property and use it to report orientation.

Acquire an optional "orientation" GPIO for each connector child node
in ucsi_ccg_probe(), indexed by the connector's reg property. Add
update_connector and connector_status ops that mark the connector
orientation_aware when a GPIO is present, and drive
typec_set_orientation() from the GPIO value while connected.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Changes in v2:
- Return early when the GPIO read fails instead of wrapping
  typec_set_orientation() in a positive-case conditional, avoiding the
  wrapped ternary continuation lines entirely (Heikki Krogerus).

 drivers/usb/typec/ucsi/ucsi_ccg.c | 77 ++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index c560d4539302..06c536d87694 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hex.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/typec_dp.h>
 
 #include <linux/unaligned.h>
@@ -201,6 +203,9 @@ struct op_region {
 	__le32 message_in[CCGX_MESSAGE_IN_MAX];
 };
 
+/* CCGx can expose at most 2 PD ports per chip */
+#define CCG_MAX_PORTS 2
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -235,6 +240,15 @@ struct ucsi_ccg {
 	 */
 	spinlock_t op_lock;
 	struct op_region op_data;
+
+	/*
+	 * Optional per-connector CC-orientation GPIO ("orientation-gpios"
+	 * on the controller node). Not part of the UCSI spec's connector
+	 * status - the CCGx chip has no HPI register exposing CC polarity,
+	 * so orientation must come from a board-level sense line if one
+	 * exists. Left NULL (orientation_aware stays false) when absent.
+	 */
+	struct gpio_desc *orientation_gpio[CCG_MAX_PORTS];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -694,6 +708,37 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	return ret;
 }
 
+static void ucsi_ccg_update_connector(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_ccg_connector_status(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+	int orientation;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
+	if (orientation < 0)
+		return;
+
+	typec_set_orientation(con->port, orientation ? TYPEC_ORIENTATION_REVERSE :
+							TYPEC_ORIENTATION_NORMAL);
+}
+
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_version = ucsi_ccg_read_version,
 	.read_cci = ucsi_ccg_read_cci,
@@ -701,7 +746,9 @@ static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
-	.update_altmodes = ucsi_ccg_update_altmodes
+	.update_altmodes = ucsi_ccg_update_altmodes,
+	.update_connector = ucsi_ccg_update_connector,
+	.connector_status = ucsi_ccg_connector_status,
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
@@ -1506,6 +1553,34 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
 		uc->port_num++;
 
+	device_for_each_child_node_scoped(dev, fwnode) {
+		struct gpio_desc *desc;
+		u32 port;
+
+		status = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (status < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			return status;
+		}
+
+		if (port >= CCG_MAX_PORTS) {
+			dev_warn(dev, "invalid connector number, ignoring\n");
+			continue;
+		}
+
+		desc = devm_gpiod_get_index_optional(dev, "orientation", port, GPIOD_IN);
+
+		/* If GPIO isn't found, continue */
+		if (!desc)
+			continue;
+
+		if (IS_ERR(desc))
+			return dev_err_probe(dev, PTR_ERR(desc),
+					      "unable to acquire orientation gpio\n");
+
+		uc->orientation_gpio[port] = desc;
+	}
+
 	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
 	if (IS_ERR(uc->ucsi))
 		return PTR_ERR(uc->ucsi);
-- 
2.43.0

