Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164254;
	b=f/6LWuSgrf6sXS9iD4rBEDpznsY/QfRH0WI5KX4r+1vcVt1PRgmYozwGbRgmJSO81ClW
	 Z+D2d1/KGdxTSb6rN7PjZGVlVdp14TkdaL6esKyTAd/GbwrnCf8JUhBbsez96B1XwSQhy
	 6uYWNKPRPtOMecaWuCb5ga3lcO38y6Bw9McSSfKJccSokA/Cf7Va2ZHuX5vVB42vy4Vzy
	 4bQWOm405LOq/oiZDw898xkMyTflSzqsIUHkdQLbTFMKuUPlETu/upr/hgBg6rjcr2QjB
	 tic3XPcNDuPrOEl1zHVyerhwOMv+g5//9prkHtl552qacN2Tlb5KkIS6FDZdMQtCSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vifw4fiaBMoMaU14T/U2tcebz59ueL1q/twov8GGvKg=;
	b=qUGtiVx01HA5jq7TOdm35uRWN+X/qgL+Tm4DcxIn3rB+ZVRXrrvlNbF/o+cJnYSmCCgV
	 gTMmHw2qDHUDjrx50vjnAa0dG5QLCXZMbJg4I1xKEQ3lTO3HbOPOfDfSynBEWwtku/teN
	 4fmolxphTpqmErF56jSFesMQRrZELb46AHghSSYEmIO2Ai0i3PU9XZMxRMu4kyKbWph4o
	 RJUJwPoIbDcOy9dkIQ5eDbC0pTuOwUwmbdvaFXuZjy9fqYixKhzQu5hnlCAmI+yaJ1rck
	 9XDfNE8EI1n5Gpp7VG0pgGCMYIVMCSmTFC6gQagUyCLl/tMhLNv8T78JQRxAW0zN42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BvxZVpL;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5278606B49E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5278606B49E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BvxZVpL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so1632942eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164253; x=1795769053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vifw4fiaBMoMaU14T/U2tcebz59ueL1q/twov8GGvKg=;
        b=0BvxZVpLfn0e0mGwo5Bu4bR+k1ckmHiqq3xf/M8s/nH8zs1hMTE6J3JGyTKMGF1ncL
         bnY+gYTlZx4Qz9MLbqoXX6oh8zFiigiupufW4d9xIikHnGeXfSqrodGAlcOToMKNEXXY
         z00nkgxN7McsoCfhtXvuDmYj2DV7jnZ21vJ+bF27cAKLkZ1W1h2EtDZ3rAFiNS/CDfH7
         43AA55uMOp+Ebd8BzdhKw3c3mXN0qOIoNuQsibswvAwocN6Il9EeqJRsZEPoHUoTg41U
         4QtkDqpPgU+Gni6eWlDtCqlyZKvR/MLejfc8igbuqsYWQPnAMHBIAQP5zKrycLpCFgqC
         WVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164253; x=1795769053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vifw4fiaBMoMaU14T/U2tcebz59ueL1q/twov8GGvKg=;
        b=MdoMoIS3mOEE0bxcgM9FkqK+RlQbhzLiYov/5zEsUy7UNRvxNWEPckWdfjkHYeDqRc
         2PYT4Q5cBFujq60zTIwq+AaU4F4Lxe0eP3/OQQRYS4lvPS8tJUmqCpvC2w+mQggrHlot
         BFqJWg24Mi/oEopiyUL+Yqmg9UNumticDcALv4TbeNBcOKMh/udOsWtt8qxHtElUhArU
         m0zxkB2Cy9ElN7iidJFmqAVbDc8pLBCXsxOjmDoBL2S911LfPOCk8rQB6b084iQZNaeS
         /n1klx8Tlj0hpA0Yyxty5R3AXmmw1tSYLFBQ63WwV7T/h0Av+/HVC/DzKKVP8URjNKNC
         igYg==
X-Forwarded-Encrypted: i=1; AL+hErEwSWpAyN+vcLSVpRtlwfOSKpQeTDKisU9utlIJcy+vO+lmF8fXb8X3dILEcTaC7xAIW6pcL1GKnvkFLOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lock7rAH6m/XR4CWU3WIK/2LlwtRNL0dRjUKHGf5xzIM9DNV6
	vzNrajLuOA/PJyw6MpBABubKpr4al+LAg9OVwx3YlOqyUndLj77zMhsH
X-Gm-Gg: AYBFou3M9O5p/skGWgUg/Y5pW5FyI37v57aZWJLKryDVtEVn3sGoiP6iuiYNjWmlMnC
	IrViGVnbvPwxn5lR+z0jLia55ywcnlGnJchhf+GXE6AEou0lKt9wABenkJjxIbDgyLncL9ENYZf
	tAzqeKu9938qRotx247LcL5WzRBFlE9L5iafojY6FQoIDNxsUGtiAR7rzoH1lW+hLYn3BTNgzCo
	qoe4k43MRCs8FlVZKNBl8NPI44VUoJHPkvSOj+QzftChOPeXoDrAiiNLNUUB/D8omP4fdB+ubGE
	C/D13OIVojRLM97hpA9ED173NvzItJdx+yPvXm2gPX25W/RmYUG0LhP+NkXgQ2rVSMl9rLe77aY
	Mo2DJKv0Imk7ko0UuRMQPU1f3KZEeyp5VyA1nUWwIuC6gYl9Qw4uxnvmSw8jKap6++zEleY23/O
	HuU06dq8sowg0VHarXKf6/Ov9bEbRsOPobwNttGh4+7yzWXyBhd8AU9iYn5jDEov2KzfbTH78u0
	UuCTNemHE6Ohh2Vne0ZJ0ZErFlXwkmMJWKaUfBJnihBYiIdKwspUWdqXYpEyLiJCRDYyKYfOZxg
	emy1p0aiNA4sFIiNKcoGhzYXpUKf2w93cjqQJ4PTL+YY8aNfhmRGaab1XdSmX76biJPE727gKqX
	b+Uu7bd4BpeHU8aXJHg==
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr3073096c88.18.1795164252855;
        Fri, 20 Nov 2026 00:44:12 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:53 -0800
Subject: [PATCH v3 02/18] HID: logitech-hidpp: preserve transport error
 codes in __hidpp_send_report()
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-2-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

__hidpp_send_report() returns -1 (-EPERM) whenever the underlying HID
transport write does not match the expected report length. This discards
genuine negative error codes returned by hid_hw_output_report() and
hid_hw_raw_request() (such as -ENODEV, -ESHUTDOWN, or -EPIPE), masking
device disconnection and transport failure from callers.

Preserve negative error codes from the transport call, and return -EIO
instead of -1 when a short write occurs.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index cd42783f85b6..f7e654d82805 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -279,7 +279,7 @@ static int __hidpp_send_report(struct hid_device *hdev,
 			HID_REQ_SET_REPORT);
 	}
 
-	return ret == fields_count ? 0 : -1;
+	return ret == fields_count ? 0 : (ret < 0 ? ret : -EIO);
 }
 
 /*

-- 
2.56.1.750.gf70dc682cf-goog

