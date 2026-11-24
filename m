Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510411;
	b=Z+iTsgY225On9JX+91zZ4j7+nl5Zc1bI/cCdBCu+twDsqoNZ3qWSzv4i7YYdc/hZcXGC
	 P44DrIClnwGwE4JWN2+GobPDgx/AzVZqfAZFQpcjDj24Nu+fmkYU4Yi7MCBFOxjoH2kfR
	 wSIDUjO1C6U6FCHtbYuQtKQnF6tX0alKwhMMctWHnFJVZkPJOBD0J4VtoJ3DdHCe/b8pR
	 Xdmv/1IyLBw3HB8PwOb/CW1YoOoDWqIefj3W/ExCUj3aL9wF4hyMKE7s32N7HNinejxhP
	 plLzNkJbHSb89rnfOXMYOlbc4Pkb74CuihuvzvrFstvlCBrdvMOGkmJirsm44ATXm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
	b=YuRsUHArpoxgimhwb/91KD7dHTaFtCiJo+ksT3BPfjHJHW3m8ePwFGwuZIoZ157X7lxs
	 L/WBR/EKUlKIy9xF9QWyR2vZu/hYXAK6MMaOcFMuFt+K40aA6/o0aBO0dZh2entUIliqO
	 gwsFIrkeSkDQI3/NM03G638bgES+murp3nnEtAbx6eixu4Mjiok+vaO4v/LtDzQfGr3aD
	 iuI22xXEqUPF/sodD+gG/LYAMXUqa699Cx3d0LENdm2532XmGTT9Fk58wK9g2VbQ+NTvq
	 rvvHM5+/Hm+qNwinV9ibDrCrqNVc5og9LhTFF6gBlKz6U9kpmxK8+KDUU/5bO2Ex7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUmP+pEb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hogAiqS9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FE606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4FE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUmP+pEb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hogAiqS9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ntWM1598245
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=; b=EUmP+pEb1ONohaQO
	aDv2qZYfx2yo2V/i8imvZehbc44ZVUf7NNCfTUgyZX8TQy3x+1xZdEh6CFC1ktET
	CD/9ricmanB0yWQnNV4TGF0mKdVZ85qV7ad5L9uRC6n/itEnnZYFah3KUVEiVcdQ
	uNKbbA2wycyEKoJ/ajNKqHL9ERuxvfvDrGE27rGIf8+zw0+gtDewDJaVDUWw9UMx
	DCfB1QO5WuJNjMf4JecA2w+aMMN+NdGL3vwQfTfezfEM6CYqBX+vcAneVqGNUnHn
	w2FR9bMdmrb2ZWkhCNYGp/NCuKekHXhczHzmw3WfyMD0dt5ZdVDjY8YAFIRrNak5
	eYq4vw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqjp85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso4479671c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510408; x=1796115208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
        b=hogAiqS9ew44opHKgcJNqS8DhZ5KzkIIdLQEAWjHmpAqdI/RVOqKoXuDOvGU75DFSK
         pX7khEAZ3tW5b69GGr+nh2gfJTZWO8olhr0IhXTKOKHT5oO5JSAUfnlWOueXsG29Ud4e
         rGhDZcFiJakZIVsb5RB1IVHUFXW/M1XxZckMsBkEKqsKjjBoNBHLwvIoaxZSIrjUbsBe
         bTb16Gjtp/BwuZsKOJNFG9Z6T/JvyxsYP8NmbuEBuP6QGngFhPuJrSj9oCnH+c67JomQ
         0OFF91qA5ubzsW4bzl0dd8T01VLjHrtsklrUB+Usketf1XvHQqBGWpg1WTdeIYS1geHi
         ZFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510408; x=1796115208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpOYBzCVRdFVbInzZxc+vHY/9MU+Lfz7H4ENxMVP8gY=;
        b=lFtszUHm9J/llYJ5zuLPaerdKL4CWNmPjZBcHb2mqIo5rkV1rF+Bm9k/QxohRQoP1a
         51bknWoQfv0gvHx1sjWnd0b2bIKzT5+4dk47nrOTtMfvJIgqsmZwIuio71eWwLArlw5H
         Wlk5jTh3q5xg0x6SPpVA4IEU0VOGSbWXyPrACkavCPtsOK2+zVUt9QpjhPhYCbXwP4Kp
         GUDen4gPR+SE37+0eskuIHFMhJ1tnh8RqR/091lkNoABTkDyFvRctNpIdFWLCWceb9/c
         AG21qUNPazLyWQu9elNG4CN6Ms8+iAKN5lspSKmMzB6porMkgdwFdGNDz8iodKpL+IS5
         sjUA==
X-Forwarded-Encrypted: i=1; AL+hErF89S0aOqAB/h8d2UA1ZQcZ3KeN5d4JT1fPqsLAPNyQPTXodMam8x93K8DdO8bp6r284fixYU28/pOJ+eE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x2xc3Nh0l0JlapwTtN2niqVBsHF8YCFJS9G6K6k+goCwdRxjx
	DuJ+VwGtsIxM7KX33i7yb9rRxOMQ8/ZizAxyQiz3dLpPs9cGqbb6oxGw7tq+t9ItrzCZ+MM3qll
	yYdAT9AEhoG7YS5J+CkE1DLCDU5SaiIkV4C1/7cepyAUucS5/HMOtofEjF4wKa1aiHIE=
X-Gm-Gg: AZFdTZczGYPirXPlY02jJteiD4orrK6WiWu/mrSFVD7rTluZXUzxAUEd8BDswOn7t+1
	0Sms8F8ivZBgk9pW1JuZa48ov1vo1SBSZL56Zur/kMmTvyAgH1UohmFttDcW8dI40t0W9d1z3kO
	m8TRxSpjwwAouLoPHDEBRiKgen/L2enyGcb6zbkb5PdwtH9j5XYXYzYuqALDsPpb8NcJIfkb835
	lTYf/x6wM2bur6RJaSO5KcunnvBGiprRS1NVw6GyO7q/c2X6pdoxzCxGpgkeJDK+1YJFOVill4Y
	GS3/7U1xipBc1RycKWnKqWu9BLkK7O/LBx8mCt+o7hpbzQJ8ZpJxIV7Kazsb9Cor0tBgOlnkq6a
	pzvGHAzo+n0Okjm8me8G4OF2z/NE7olpgOafXjh+/k/J28ym4Ag3Zw0IHrq+EsINF5Jw5VyI1AU
	qCtQ==
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr14700288c88.41.1795510407890;
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr14700268c88.41.1795510407291;
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:08 +0530
Subject: [PATCH v3 4/4] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-4-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b055089 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX3WRT4NCKi0zF
 C9MWN8sGGjjSI02gxZUXCqihNeUWDofS/jIjMZIzuhubNtj1zPzWOLfEj3e5quv5OyBz9idFicB
 xSMK+codv8yiWRNggH3ljXZICjPJP48fxvUsRreUd0FYx4K/iA/kkfxenBLbyLU0u/SiMccQ8Ld
 foPYLyLaBWvHkkgiwxPLI61AunB+YNe+JGv/LGQ1vZQGLXCcZMQ59ZK8Dvkl9cn/hpAmGQSSMcM
 uTAFpzZ+41xLpCHTv5KAOUJvrN9dK+GMJPnjpYJsPSk02TCefIFCWmlFUQLYLt4sx2Vg8KH49rA
 tHgM59x750cWtOJ/SskMM5s6uu+FJeARg0fpzaWXAvkILOHORT5nCY9RPOTBoOoy5dRkvP5xrwv
 MASOvgB2nc1vcnTzTV5ZTHwg0ykXKPRgGpPcSotkbcI4hBk9h2bNzIZ8E9/kqpA0XbjaZ5ctiX0
 44IokNnFuYp4OLBWa7w==
X-Proofpoint-GUID: jA2C_fhspKj_h9tjlje5xyhtLradhZRS
X-Proofpoint-ORIG-GUID: jA2C_fhspKj_h9tjlje5xyhtLradhZRS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX2yuGZBoqf997
 SkK9lcwqoRHE8mUDOIPQGqHjW73yVu7LoULg19adI2h68YrjC8fL4KPl729ZWRNz3AGC0OIE9L2
 wGmbnqVPcuCZD/RyZKNwekmlIjYKaPU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

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
 drivers/usb/typec/ucsi/ucsi_ccg.c | 77 ++++++++++++++++++++++++++++++++++++++-
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

