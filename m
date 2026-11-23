Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.172.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431529;
	b=J8BuloQ8jpujXcdzuPy1Bd57yHChpLO2OfWIBydx4YCAxdazatDR6Bc9dMn/9AEuppyx
	 4cqvpnZ2dcuJriX5BLZLvBqsapVzzhrxtcX/nD8wThhafAcLeXZd108KaoqU29bk3x8e9
	 KCQI2d9fcuTsrhUpJT8o3CnyOIA3BzZLjDZc04uiygROtNiJhbtLUm4xa0IBvjpS93l7q
	 i+AfOA9MZtJD7NFgu35rbOACpzKGIQ+YoHD7Yhv2w40LVADsqQIj/MNyZivJvAhfjUCr+
	 yFlCGQzThcyJHzMlmbD8C9BjIb/XQD+Xy64h1qjocKBaQF4oU67f/WjGDWaLFDCJJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431529;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
	b=YymLNJoLKmVRGZHT8Uia8Hjj74Bdl1my4NK5kdGM+0XBM0zuFbXVkkWwUUmxFBQT5/UB
	 jfjckTWLKLX55Wfe0DPOFa0/Xx4ShyxBTJB8Vqk/M2o5/37vwj3DW4mUzOJq7HgJCLU7t
	 cN82mT9txzfXqBY5QHZ82FXXz9PzPg7XV/d2HDXHDS6WLTBSun1VgrdepWnMxReMLdSZ7
	 I3R48Pn+h46nqq6cJtFBxCl/NaRhbhi9itiJx7Q450kpf1BWFA02yPCkD3dG3RKtbFAHx
	 K1vunY+MlpoD2SmjgjeGcrh5bBJq/mG0+t/D6vLhmQlz1UDOhCBLPjR3TK95cwsWbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=iV5+FCS0;
	arc=none smtp.remote-ip=87.98.172.75
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A5606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020A5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=iV5+FCS0
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.231.136])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jY2xD43bPzBNtP
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:58:40 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-n2gw4 (unknown [10.110.168.167])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21D2CC0121;
	Mon, 23 Nov 2026 10:58:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-n2gw4 with ESMTPSA
	id ObWlFF4cBGvNugsAptLdCg:T3
	(envelope-from <filip.golas@3mdeb.com>); Mon, 23 Nov 2026 10:58:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002608931e3-f8f6-4b97-a48c-e908ac0eeee2,
                    0A512C1CF0928FB71961449F2A077E304137B0E5) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v2 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM write support
Date: Mon, 23 Nov 2026 11:58:20 +0100
Message-ID: <20261123105821.305527-3-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123105821.305527-1-filip.golas@3mdeb.com>
References: <20261123105821.305527-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 2044634232477118447
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTErAGWDIhDAmmUw5Dcw5mhi5B/4PFjYzh+FFWuHb4zQf5HTh4PWkjVfNbXyuhtFva7PORpTwu40kxu+I5Lb0yQmC6vrYcK7aq2p4pzn8s7P9wOSITwql5MSfAfKz8G46Q0kR9K4JlN+9f693ty0G4JU5FGasqyl0V0RwNLsfFK03KYDaH9PKxIlO+Lpd6NBwIiJx10ej/JdcRw9PexAyk7Vi1UC061pBqW6s/ZfL1m+MnI94eZR7QDzB1e2vYbUBHy1KMIswZ4Qny7ixpPQIcMY8QSKl0MtCfAUwNUmiNnwSIsoNo7zjGqtWT7HXSpsI88QrhrqL9Xke/1gKfHREY4aW+5NHUcWfaWq4tkSqgP+2ESgPOgrmiLBiOGMJVVd+FhUt8zOIs640cxigSCvHtBFzYJluv4JXYkenpWb+NW3CMOebaQRwRGg0Y/f0wVG/442aKojRWztF7RlJZ2IrQqh0uNp91HuXLKJ8NEgIMQCl/mgkQqwi4LY9ia1OVDvov154iKScQVfPa4cUcnFzFysSI16q9QOS9bK9oT8QHyVvK1X1y8G/R2F0u5QMaWt5zyHMcA82GabgEDo8o3Xfp+CMLpnbJEjxEnyNJYe5lftk8ECUDGTdeGo7gvEyE13EUIUeuIDyF8QKBlEAYtdRQ4rZosaxTrs/wb+cpmeTS9Z1g
DKIM-Signature: a=rsa-sha256; bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795431520; v=1;
 b=iV5+FCS0KaaUJoMsauSlW2VXeDfk47BjeE9JzccuugOJ2KhpJNMZBzjipMC7+kS2nzO+RCZp
 rKEiCyrStiAvnULkWvJLZFFfjvqpzHv/x7NgcIPqVOOVHy8MqgisAZF/p9KUTDllCJuu70eQeFW
 Bld66SvuHox8uF0RtNAW1g94KRfb7SBC0z1M66EIT5NkPlmkCpMt5PcCgE3KAeHIxQEUWHNt/ql
 jJMKwEB8vsCVF/5I+UAX5BADPod4L44vTIw0bx5jD4TLmBbFyf8NPtRbSEN3sPZLVxusXZuxXjL
 eDFpqPm0ZPyuIVmdJXjnaNIY2LWcxAl/YHhvnhKcMdvUQ==

Allow switching fans between automatic control by the EC and manual
control via pwmN_enable (1=manual, 2=automatic), and setting the duty
cycle via pwmN. The EC refuses duty cycle writes in automatic mode.

Fan mode control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
Changes in v2:
- The capabilities of each feature are packed independently, so channel N
  of DASHARO_FEATURE_FAN_MODE will not necessarily be the fan of PWM channel N
  if the two fans have different capabilities.
  Use dasharo_fan_channel for looking up the fan mode capabilities by
  comparing the group and index.
---
 drivers/platform/x86/dasharo-acpi.c | 146 +++++++++++++++++++++++-----
 1 file changed, 119 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 13d97eb43511..85f88b11fcf9 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -15,6 +15,8 @@ enum dasharo_feature {
 	DASHARO_FEATURE_TEMPERATURE = 0,
 	DASHARO_FEATURE_FAN_PWM,
 	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_FAN_POINTS,
+	DASHARO_FEATURE_FAN_MODE,
 	DASHARO_FEATURE_MAX
 };
 
@@ -54,6 +56,16 @@ static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PE
 		[DASHARO_FAN_GPU] = "GPU",
 		[DASHARO_FAN_CHASSIS] = "Chassis",
 	},
+	[DASHARO_FEATURE_FAN_MODE] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_POINTS] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
 };
 
 struct dasharo_capability {
@@ -143,10 +155,45 @@ static int dasharo_read_channel(struct dasharo_data *data, const char *method,
 	return ret;
 }
 
+static int dasharo_write_channel(struct dasharo_data *data, const char *method,
+				 enum dasharo_feature feat, int channel, long value)
+{
+	u64 arg = value;
+	u64 ret;
+	int err;
+
+	err = dasharo_call(data, method, feat, channel, &arg, 1, &ret);
+	if (err)
+		return err;
+
+	/* Non-zero status from the method means the EC refused the write */
+	return ret ? -EPERM : 0;
+}
+
+static int dasharo_fan_channel(const struct dasharo_data *data, enum dasharo_feature feat,
+			       int pwm_channel)
+{
+	const struct dasharo_capability *fan;
+	int i;
+
+	if (pwm_channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+		return -EINVAL;
+
+	fan = &data->capabilities[DASHARO_FEATURE_FAN_PWM][pwm_channel];
+	for (i = 0; i < data->caps_found[feat]; i++) {
+		if (data->capabilities[feat][i].group == fan->group &&
+		    data->capabilities[feat][i].index == fan->index)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
 	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
 	long value;
 	int ret;
 
@@ -162,6 +209,17 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = value;
 		break;
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			/* hwmon: 1 = manual, 2 = automatic */
+			mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+			if (mode_ch < 0)
+				return mode_ch;
+			ret = dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
+						   mode_ch, &value);
+			if (!ret)
+				*val = value ? 1 : 2;
+			break;
+		}
 		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
 		if (!ret)
 			*val = value;
@@ -174,6 +232,35 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
+
+	if (type != hwmon_pwm)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+		if (mode_ch < 0)
+			return mode_ch;
+		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
+					     mode_ch, val == 1);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		/* Refused by the EC unless in manual mode */
+		return dasharo_write_channel(data, "SFDC", DASHARO_FEATURE_FAN_PWM,
+					     channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
 				     u32 attr, int channel, const char **str)
 {
@@ -203,6 +290,7 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 					u32 attr, int channel)
 {
 	const struct dasharo_data *data = drvdata;
+	bool has_mode;
 
 	switch (type) {
 	case hwmon_temp:
@@ -210,9 +298,12 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0444;
 		break;
 	case hwmon_pwm:
-		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
-			return 0444;
-		break;
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			break;
+		has_mode = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel) >= 0;
+		if (attr == hwmon_pwm_enable)
+			return has_mode ? 0644 : 0;
+		return has_mode ? 0644 : 0444;
 	case hwmon_fan:
 		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
 			return 0444;
@@ -228,6 +319,7 @@ static const struct hwmon_ops dasharo_hwmon_ops = {
 	.is_visible = dasharo_hwmon_is_visible,
 	.read_string = dasharo_hwmon_read_string,
 	.read = dasharo_hwmon_read,
+	.write = dasharo_hwmon_write,
 };
 
 // Max 24 capabilities per feature
@@ -283,30 +375,30 @@ static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
 		HWMON_T_INPUT | HWMON_T_LABEL,
 		HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(pwm,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT),
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.56.0

