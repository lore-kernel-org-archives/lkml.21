Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164077;
	b=GbCzNz9M9yaUSF+DZERpblsf0qK1rjhi+TzY5/7JB3aain7dhm0PuULY0Jt4qi6OeX1u
	 Q67WMbrgMUWSq+vy3Ix6mfurik0K3HEYsB6dj6XylHiSVVk5gaQZgG58Zgwqh6Hw3Mt4F
	 eA5j+GUP8fR19HDUIUwpvC7ZMKxAiM7PPDRFc7nC+xrEOz70cU/KYL48RFZBLS8Q02tnp
	 ALpLzxnjJV/eODHJ919KyfvSmrVWgJoF5dGH3nUeWSoywQNYZy+QZXBcr5odkZqfnjoNd
	 XwwF59oEqxsXjalhJUO/6I2+JjZUWMxfXhzCKiJyUesTa67Ri671mGDdfutYvb7bBig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eakGv17JCMk0nAPgz+YpjcrUUEGyOYJEafBX4gfQmKo=;
	b=x6PBqZO32riTQ1YRzAtZITDMkgCWxM0nZY+1LXCLnhYjH+6IYLlJz5kxJonJhX5qEJDh
	 WJ/NmhcuzPfcGstOGFhhdmgNRR1wYOMPbHfCGliBnl2xmeWZaM+ZjqGavTFpfRxSa63f4
	 D5ZwL9vBvqv4BgLqrmp/BXWa0Zni/0y0Q1zh7+RMNMyC88B2rmlyCRKqau2a+5s1ZHIvu
	 troaRZMww2uAntB7cgfatlEVhhESLXXCk3y9o4HkfcZtMpER6zMK4+feyMc2M0LSupiYX
	 kNs4afsYQa/uKgipdQ+luYOx42ADuHuoc0fCS3tHUJu7QN/xF93G4agkDViAsZ5wMSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdPYE9ai;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A2606A882
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10A2606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdPYE9ai
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38564b4b017so664106eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164076; x=1795768876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eakGv17JCMk0nAPgz+YpjcrUUEGyOYJEafBX4gfQmKo=;
        b=bdPYE9aiVRydFu3htQdbcm3SSeRg0s2d487qMGOc21hs/5ORfzVPIBeDeOnIUNEqLa
         WOOTe+7dTC7wLN7x7RPOWn3uuo8JkVtSCFyRbOPm0ElgnC0UhCdecYj1nQqnw3PPf/tQ
         1bVx7tuQNZbFDQsbgQnjXasdmUkQvV8lY57sNmkc1JRVy9QT2u8wmzmUzINNDGuRmXyw
         TuXeDDLzPfSz7VUHyzP3VUtl31Sx6s+289t678najQ2deQ7ZfndQ9PpGVZw3qHmQtDZu
         EECjGd4CzFALSP/OzgCQxT2SQXwLo8ItSefNfaDanU7Gz/pBmN+1zAZUTKA8nOabRWds
         Y7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164076; x=1795768876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eakGv17JCMk0nAPgz+YpjcrUUEGyOYJEafBX4gfQmKo=;
        b=VjFk9vaW4a5OvIAGdPEQVrcK+9RskfdIZ/w839gOG3aFTuzTDr+DBWbAdsC8+FNoFS
         1ZjPYcdWTtfLEtIVjc9VBD8VFu6wkiBb9wYTqn/E6XrjQnTTozT3q9QZBVViKHrvp2dy
         z+9JsNCt0eEFrJhh2bmtZVvLrEi5kEH8zbl+ujtQVVsMA5EsxbYjYBK1bQxFbLXqcbeg
         fHLfolJMZVtCMldjkkPqexJHCtz2Q65lYV1lHEnweUUGYxLQSeFhHSLA9ziOF/4lMCRv
         7QwCe0BuMnpxxU7b+wI6vcRxUwpHK4ZRbhGsJTgT4wf79SLPlzefTHtBMjhN7NOOrlpz
         opOA==
X-Forwarded-Encrypted: i=1; AL+hErFZaR8G5WjDSFTfeELsWGVjWrTbvmI1qa639pPWP5h04j8Nq7BgQ12JWYZjtTkNSWngeX6XNuRdOIax910=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b71gjTKCFqLk6KKxfBat6uetnan4HSn3xemSLA2c0lX5rY/15
	SjkYomLjejdJd9XdLWavJNCDg58mchIpJFwFzKw7mbb9n3PJtFz0sfSJ
X-Gm-Gg: AZFdTZfgnkIpHWXQ0bTNqgX8DcubU8gt40hS2Qzv1brGtzFI2WIHHV/xNGsB5MYMQV3
	WysOzZZ3ryE036omxa4lX9QRbZGJpbt+uqSATjbZtXXX53QKNsQ5WbqDBW1HUdQf7EKe9JpQDXL
	7TcnSpnBEz8WzX0osME7ItCu8aPW9E0DevfpKFVR7y79dKQ3lueFL2OxYGNH5wpSUuHNaN861PS
	Mbw2RhaOPOyXH5lu0riNNVBJd89nOV0mKr/2QYUpnkltoZw9K1wGGc5HXjWjg39CPOiAd2wGfV3
	FRHjHlistaGEmKAT3V4UIfPD2deWjqk9JZurfYJCbwrmVvSiD5lNqYqxGOLpja0u1pPmkrnqrQa
	TjoRdkecDLLflwHqrs3TSh1FEtRmPESDN6OnR0r+e2hmjCwliJUSmZmFKcl7RYFv5xAFuTMjIkd
	J2y72CAneIMsl+1QkOw+y0NcT8an9HYfk+Jwgwlm68zNrslXEHhigy13tgL0t8wyTkZfVmFpBf5
	vzqwRZl6POnmlQrAijTJT2gByGYReN2MZnnfT02TZErmehYuqHSRuZ+FwyidgAOWi13vivWy5NB
	M5HT2ygEz5LnW6Lft+n7nxWDAsl7LaXkSbjAzZ96IuCW/E8bdgalEtrJLj7UrTvIR+FdYZKd/Yl
	v8Kw1NrnGRtzmoRr9lA==
X-Received: by 2002:a05:693c:414c:10b0:37a:15c:b8c5 with SMTP id 5a478bee46e88-384b11ebf27mr4053020eec.2.1795164076070;
        Fri, 20 Nov 2026 00:41:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:41:00 -0800
Subject: [PATCH v3 12/14] HID: logitech-hidpp: mark device online on
 unified battery 0x1004 events
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
Message-Id: <20261120-hid-logitech-hidpp-v3-12-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

When a wireless device disconnects, its battery state is marked offline.
However, when the device reconnects and sends an unsolicited unified
battery status event (feature 0x1004), hidpp20_battery_event_1004()
never updated hidpp->battery.online to true and did not include the
online state in the changed check.

As a result, sysfs POWER_SUPPLY_PROP_ONLINE stayed 0, power supply
listeners were not notified of the online transition, and the 0 to 1
online transition check in hidpp_raw_hidpp_event() failed to schedule
reset_hi_res_work to reconfigure high-resolution scrolling on reconnect.

Furthermore, both feature 0x1000 and feature 0x1004 share the same
hidpp->battery.feature_index, event ID 0x00, and return 0 from their
event handlers. Because hidpp_raw_hidpp_event() previously called both
handlers unconditionally, an event on a 0x1000 device also matched
hidpp20_battery_event_1004(), corrupting the online state and decoded
battery status.

Include !hidpp->battery.online in the changed check and mark
hidpp->battery.online true when receiving a 0x1004 status event.
Gate the event dispatch in hidpp_raw_hidpp_event() on
HIDPP_CAPABILITY_UNIFIED_BATTERY so 0x1000 and 0x1004 events are routed
to their respective handlers.

Fixes: e037acf0b1ae ("HID: logitech-hidpp: add support for Unified Battery (1004) feature")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 28402baf04fb..c960d26a41dd 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1761,12 +1761,15 @@ static int hidpp20_battery_event_1004(struct hidpp_device *hidpp,
 	status = hidpp20_unifiedbattery_map_status(hidpp, params[2], params[3]);
 	level = hidpp20_unifiedbattery_map_level(hidpp, params[1]);
 
-	changed = status != hidpp->battery.status ||
+	changed = !hidpp->battery.online ||
+		  status != hidpp->battery.status ||
 		  (state_of_charge != hidpp->battery.capacity &&
 		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE) ||
 		  (level != hidpp->battery.level &&
 		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS);
 
+	hidpp->battery.online = true;
+
 	if (changed) {
 		hidpp->battery.capacity = state_of_charge;
 		hidpp->battery.status = status;
@@ -4200,10 +4203,10 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 
 	last_online = hidpp->battery.online;
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
-		ret = hidpp20_battery_event_1000(hidpp, data, size);
-		if (ret != 0)
-			return ret;
-		ret = hidpp20_battery_event_1004(hidpp, data, size);
+		if (hidpp->capabilities & HIDPP_CAPABILITY_UNIFIED_BATTERY)
+			ret = hidpp20_battery_event_1004(hidpp, data, size);
+		else
+			ret = hidpp20_battery_event_1000(hidpp, data, size);
 		if (ret != 0)
 			return ret;
 		ret = hidpp_solar_battery_event(hidpp, data, size);

-- 
2.56.1.750.gf70dc682cf-goog

