Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246396;
	b=GXiDOdpju5afvuIDVqfl6Dakx3N4s65VjrwNKpPryMuDh54jNkEDtJd3gcXOaO0RuGYw
	 FCCfapI9nyplkEINmAvAV1TAvuU3XW8sWhvhQgiI8Hx/J3G92OvhDDl2mCYjJ+qAAXEbJ
	 k5M5rWfp4MoKmzpRXCJMAGdopYzu4w+lXfH/iorkIA3cl3CTibJVwA9l2OEzGiG+5XezV
	 18/PW2Ocj8+GUf4aqIE7Xkzd5mtwlewt9o2dBwNZoK/PIktLYy1IfKPtwQ1u3Yn2bR0LE
	 figlbK9ESSqCKqqv8MG0fwMArQU9zYDX4ODjByLotsgVKCwgbJUVrDljI4p/pIHqM9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
	b=vXixkH1jt8at6lusdvjS6xLCQwTTO98dQfBTOl115MSJxHeAZqZxaX1JUso615eQiaaO
	 weRTNPaaM6reO+dzIl4VtBtqmdRZrmZjQPSWtSHRkh0Mm7moYyTLc3q+gmD6MmT0QZ7vA
	 kRbV21pqiyGoAUpAZNBsm9Mpur9D4l1bNFVxP7f4PqAqAQuo4btrJRu981EjNOwVhn9S9
	 EmbWQVZW2JsZsIXnUo6t1+Kv8sAyicS3yNjhC26noxjTkF+1DV9zqvXPHuIlzOupwhQdC
	 ewKzX+GevOxZYcnWIVkIvyej+dzyu3noGYIXdfbbwp/n49i+rG2eIV8rjL7kikYbnNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1KOuyd3;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB2D606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB2D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1KOuyd3
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efdb4499a3so1288865ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795246395; x=1795851195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
        b=g1KOuyd39DbO1oJZCtZQXHAn3r83eoHFvdLOFAI6r1gcMgxhNE2+lmbsNryPqUR5AW
         Kel2datY0J7UYUxZY6D4S6tgYPu6kSzulVufKRKEzqy7Tk/GmdNfulm7DdpnRd4QXKaY
         2sSmceBXbDZfpb0UXzrHiIzTPW7AfIyBRpeFN0EBAfM1Ibu3dkiXiPZprw4HeTNOzZUl
         GgBBCQMlbL4QE75HrX4LOp5N+YSwOlQcHm1pVcyidVVbBb/E2QLFlr8m6asAVNnJ4rA+
         BmnzbmNp9JuNHsHAixgL5JBO/4HvBljTLUIOZDagJBcDJAz9UHhz75/L6ZBBVaXg546a
         x0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795246395; x=1795851195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBrHrJ+Fi6ULgqrmNdXQFkJ1MFe995vz1lrt+TAu8xU=;
        b=AgOqXegZi3zVJvGw8LvwY/ydLRh9jQ0DwVOPWt5XXRO2MLM54AqIboSy6CclSi2fI0
         v1LGId0x6SfZTe/Mv+DzIjUMfL0gns+iHhkbFiuHxNAX0oIkFhgGl87if6B524eIw1eG
         9h2Dxi7FE9YD4dJkckAAO5MZ5ctd9wDiEvWscN618f8qj2FF/C7mp2I+MD45b/RW8shf
         IkZ7+DLf+X+76Cj/kHGkpGemRGzMiSPqqeSBlEV7TCPIqGZWvB395m3IJ247xfrZ8uvo
         hitSlNfY6BBUiZRVDOO/SQ8SUDNrq0KgqCDnQEtwG8Uhv2mjQlVAnVdIxq9hgbDz7NmQ
         DtHQ==
X-Forwarded-Encrypted: i=1; AL+hErGB/JaTZ19XA7FOAwF3HABjd5F4lBAgSpE5Eea3dU9az7tKoCLmGMrWcb2ftnXyAMRxw2fcVt0rxjXxE90=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O1ZluRARU0Re6svG3j0bAqwlii1HcNDeLsqxh3HYfooUIZdw8
	W9AEa+31FBDYVxezn61NZn53An47VuzsTQTyxQKmbd3mFekqiKM/pN8GPdYBBw==
X-Gm-Gg: AZFdTZfcv2Uvb9Sn6PBC4qBEbE863Ij5hDm1bHX0bpZc5QbpmTcGxd1C2U4C1Eh3wZa
	6ct5fNKNubFvnCcozStpaKKQB64LMpg2gYtWOOK82Cm9chfFBzXXmkkZYlK+OeOtcKCAkFLD91B
	FBq+ozB2GYqaF7GOTpoVvE6Hi11wiBgT8xX1fnRekE+xwrRzz/H/EfgqMrm2e+Oe5Ml2qrIg40/
	rlv5v260XrrEnk7vSQi2bE10G0Blm3/SpMgLVPBz6pv8BT5gYmpYtPYX1tPrLcGX4QIUsi6Zc9T
	Emv1SMalsmPzq8O7+Hvy490wwIak4jJ8X1lcrmolpjkYYDQrBbgmwAD3FX98nehe7fvXu4esdpK
	kWS/HeEg4ztgkPEsgXwilcMUO0OSj0Xs62TvJ8mdwQQ66sCJi8P8eZiyV9DEyvp4QKXsIA50zgw
	DZ4WVDUI170zjQ4cxoR+zLp31EDhIVrV3OtYFO+BzdbQLMyaPtvggyqmyHVVTwkcUMwE5uLuaxY
	y5xWtCM7enXhoOhzDYEdnPPUfuZF8nj48mFptEG32/w81H1j3zoVIw+KfGrNne97N7oleNpcjey
	TFYRaLWHGqc7oWgnDc9iZbbU9340s8zGVNuK2Kam3PBW1pp6PWeNrw==
X-Received: by 2002:a17:90b:57c6:b0:3b4:e3e:642 with SMTP id 98e67ed59e1d1-3b41c579226mr8216561a91.0.1795246394913;
        Fri, 20 Nov 2026 23:33:14 -0800 (PST)
Received: from [10.232.20.87] ([101.90.31.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm10344021a91.16.2026.11.20.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:33:14 -0800 (PST)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: musb: fix double put of gadget device on setup failure
Date: Sat, 21 Nov 2026 15:33:10 +0800
Message-ID: <179524639094.16200.18023925953069130613@gmail.com>
In-Reply-To: <2026112011-dingy-onyx-4d4e@gregkh>
References: <179250629747.20696.17364135141613638741@gmail.com> <179419596286.2244.11782596409403661076@gmail.com> <2026112011-dingy-onyx-4d4e@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

musb_gadget_setup() calls usb_add_gadget_udc() and, when that fails,
calls device_unregister(&musb->g.dev).  But usb_add_gadget_udc() already
releases the gadget on failure: usb_add_gadget_udc_release() calls
usb_put_gadget(), i.e. put_device(&gadget->dev), in its error path.

The device model documents the same rule in the kerneldoc of
device_register() (drivers/base/core.c):

    NOTE: _Never_ directly free @dev after calling this function, even
    if it returned an error! Always use put_device() to give up the
    reference initialized in this function instead.

The extra device_unregister() therefore runs device_del() on a device
that was never added (or was already deleted) and drops the reference a
second time, causing a refcount underflow.

Drop the redundant cleanup and just return the error; the UDC core has
already released the gadget.

This issue was found by manual code inspection.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---

Resending in full because the original submission fell out of the queue
during the merge window.  No changes from v1; Sashiko reviewed it and
reported no issues.

Link: https://lore.kernel.org/linux-usb/179250629747.20696.17364135141613638741@gmail.com/

 drivers/usb/musb/musb_gadget.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..4bc4270088bc 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1794,13 +1794,9 @@ int musb_gadget_setup(struct musb *musb)
 
 	status = usb_add_gadget_udc(musb->controller, &musb->g);
 	if (status)
-		goto err;
+		return status;
 
 	return 0;
-err:
-	musb->g.dev.parent = NULL;
-	device_unregister(&musb->g.dev);
-	return status;
 }
 
 void musb_gadget_cleanup(struct musb *musb)
-- 
2.54.0.windows.1

