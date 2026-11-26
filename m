Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679612;
	b=cJy3VZdLGFzWJlgMt29t+Dxaxfxuo7sW5+NpKSSDblgV/VmL467G81EG+Kr7JYR/2QKi
	 LeZbqQ2Hp557YW7BJIInuwqACEp/tXbhYQo+ndAQe89u9lVF/79LWvm+oFpBiuyJaGSGO
	 Gta2+4D1L9vRuuiqQa5XPgHwtPx58rdn390RkV2DWPEoX+Q3dfKoamhY4AH70EhPNX6vl
	 jMMdt0ifTNahVKQ14AGpfynkbulVLqT4CHpilGINxjlPvL6zOj+UVTAcfQJPxAnj38Vrl
	 Zz5VbV8DWJCS8g9u9V3biqOn+lTJR9eAygEFDQ+sLyFEEd/mp6tAAJaQ35ytcPqrEPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
	b=GVtIGG5R2Tcnqpm/BPc2yuWs0oaFrwFvlthIeaTSK2hhU6dAcwd3M2jQuSh3gckc8A77
	 NYjClptjZvRVa2wkAmD/89d2I1tN4PIVf7/+c3qshyT/uVXT+q4FPwJH3qqjsFWls/8ro
	 H3bw0YUW6XixJLqXkQODUzEJmI+lPTGfYTPlAh81OW8SiF9I85h07T4rQo88D3RtOMAKl
	 D8JKXlilGwPBRIMjBSBv/j6HNHEZrtCqRyTPH53m8FCi6P8hxOw4ct4wCP98DccCL9ys2
	 Je0gYoCS+9BCF30eZk9gZz7HRHhPSQ9UMsJsxI7ShgGpOXwr1JTjShmjR564wLsAyqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK59hEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D690C606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D690C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK59hEc
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57728d859e9so2853225b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795679611; cv=none;
        d=google.com; s=arc-20260327;
        b=mfARgJqrZ7W5K9tYSSsaRNdKak34totF+BvoZvNgH/ww2EOQTRNUHpPOydbPqbH62P
         vXdvDIqqVu3vmUILnib0gAgcAcwtcNCoqULoxBrv+SuYg8J04cll0d0hPBLjBJtpoQ9y
         ZUODE+E3lzH58DXu0RsHL7XiLKBimxrd7raS8SX9xmsvZIWsTqkYHJ3+LTOgN5FLDvq7
         3SGcbMoIW0iCXdGmmb5DBr3no/rhpfxeJDUyxBDdd7cltZzP+1FFOIyxTNr0K6d6XgnX
         DDS1vWPDDKZvjwMYSkw5aXqa/4nHbikTJNnnGuEFYWfUu07YBLpvOj2JH94LdsS8PnVl
         3b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        fh=ukrydC/duK7xV/YBt2un6T/R0VbAJOBp1oIcdEtUWVY=;
        b=hRe0qnzXEqHLyqolDG6kCp4EI6FcA1l0h1RiQ6XnPTEjg6Ux3xdEcPVKPC6P/O+ikp
         A/bELRa7jZO/3o6bzBAtPcN2PDkDuhHBHMxwCcTxkPmRK5/AMrMebg+l4EYwbU6uXYnA
         zV6DAOGFKWATdVxp8RHVReFwm7ofILc5VsSuCPkFlAzv1VF08hNZ1NvVBU3dZOjiALvD
         g+G8L0b/VhCSHgnp33i31r+MhgG0rIIQ4M2KSg/BtwfTXjcBfA+60hAJ65sqNN5ouEi3
         Hif3lEzdzxE237DMfLUzM6om6ZDYiTzg1zskRWUk+nxOTWIICQXfEDdE2WPrfZ4civV+
         SFeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795679611; x=1796284411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        b=pJK59hEci0NYV3VAUFOx2VwXhMF3Q49JI9mO+/n6JBlJAuxY62KY6f5o+AO4Ektg+4
         g60uxaKe7VHvHmZUfECxnMmaquyQRvaZVUcUEzhco6OGPFB4MgDDwrDMEHvcvsE1WhKE
         050nQGFtc0S14UGgBZn5eug3dbjZdxBdIv4LDMYYSXs1ltnV12IBjDa11vnhyjvgoXvZ
         IzYofz0rZqb6P4LqpgXHF5LfxaL4gbXBc7Eo6fUfWkbe73NQU/d5xexuY1IB7hQ3OLY2
         V+HhamJc6e27xT5zUxlnGTxi2R5Q4Q/9oMxhCKetKHPEU0mWFUOfoIygulDNkbaXqXxi
         7V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679611; x=1796284411;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        b=pR21SBotpTOQixmeD9fq4NtFGLtvletDs0RU7iZNp1XQWfPpOkjgNyYVOAIqFhwRdo
         xEft5hkqOR7B4kvcHIE0EXs2QU3M+1OsNUo87a0DGyx3pmj1ho6yFvkI7VfWKO9AiFQs
         WMMLy0J0Xluc/6WB4wYE/TlakXt9waohbr5LaT9rGNGg+rqc6qsAGA/cnQCH15bGFUpd
         Cgrvnj+j0cSRsh8WajWGxoJP9NlOUf7LillURK2FfPfdqQm4jfOMv8i+h5YtxLdg8Uud
         0XI4YDUELo7GFuTC27VdDFIoTc7HbVf+Dm4GOlvF+H4HuXuNxD/h80FniSHCFAw30XDh
         oSDw==
X-Forwarded-Encrypted: i=1; AL+hErEThm4gjlC/lDjVlt2szdNaXcklW0dDFwxVZ8h6q1qtGW4Ddfs+qy9u7FOelxoizGiDF6uUed6NWL4zvf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zRgVAiHc2CgQePsTAD1pb5CsK2uagCAzrjJarjh4h90+Q7T8L
	BSdJjkzaeYDv1cgUMYatQjtedPdsdp/uqw9VELqhipH9UND2dMeUTtVMh4aAUC6Q1zdLsBVJCv2
	2nQ00CaaF3Z8MG2/dCTFjLgH+XbSsCKU=
X-Gm-Gg: AZFdTZfYvFFtyW4JiXpCZ8fVYsiS8GLzcjV5uP4aO1vPtfV9rxUPYyxSBdxQ2weoGTd
	RayMbOXQNmLo3F/KUsfK6wxtoTxRt0KxXT0WXlNA4kjQd1NqMB4RIWNnyy3qWn0vfq8aEN4XLd+
	h8xjo1P/YqQpYC0DoC88jBB9nU9BrFi4EGmZt9gbdam2fe37Wb0UeSs/83EYtyW8Er9dEHo+/B8
	rHswXgLWYH1t0IHjr6Bj+ROpdcQYdB36vfH2sG04p1/+zPajqyRrnDhE9G7symNt2yPztSkC7+b
	uH0AnCeibTw5zMT6b+xhtq1ZktC51saZ2ivOJejOOZcV3lYdRBkf7SmdlSwLHhd/t5/34nf02/Q
	tl3i+uPEFIwEXzpUz85P4L2H5ZAXsouNAyduwGhBMmsttwbx6p9JHCkikKVoDKrIJIdwhYCSby5
	5hjBNkR77RfC4=
X-Received: by 2002:a05:6808:c211:b0:573:4e8b:1f5c with SMTP id
 5614622812f47-57a0b048d59mr21586085b6e.35.1795679610811; Wed, 25 Nov 2026
 23:53:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 07:53:30 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:53:28 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 02:53:28 -0500
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
References: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 07:53:30 +0000
X-Gm-Features: Aa3M54rjQOTfrEGuME4pRYe3YlmWN6OOM-LJ3XqOYHFi_CfawFiykrKk7vGrvo0
Message-ID: <CA+m4KrA8u1reEQ8w0i8OXytM5SMhfu8sj_zSVJc5j8NpGv92vA@mail.gmail.com>
Subject: [PATCH v1 1/2] usb: typec: ucsi: gaokun: Forward HPD low on physical detach
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On the MateBook E Go, removing the DP adapter can clear the mux, CC
orientation and HPD in a single EC update. By the time the driver checks
the SVID, the port is already out of DP mode and the HPD bridge misses
the disconnect.

Remember that a port has reported HPD high. If that port subsequently
reports no CC orientation, no mux and HPD low, forward the disconnect
even after the DP SVID is gone. Clear the remembered level so repeated
empty reports and USB-only activity do not generate extra disconnects.

Fixes: 1c2b66a7d725 ("usb: ucsi: huawei_gaokun: support mode switching")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 9b51b60b2..9cb7c9bc1 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -99,6 +99,7 @@ struct gaokun_ucsi_port {
 	u16 svid;
 	u8 hpd_state;
 	u8 hpd_irq;
+	bool hpd_connected;
 };

 struct gaokun_ucsi {
@@ -326,12 +327,17 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	if (ret)
 		dev_err(uec->dev, "failed to set mux %d\n", ret);

-	/* UCSI callback .connector_status() have set orientation */
-	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
+	/* A physical detach can clear the DP SVID together with HPD. */
+	if (port->bridge &&
+	    (port->svid == USB_TYPEC_DP_SID ||
+	     (port->hpd_connected && port->ccx == USBC_CCX_NONE &&
+	      port->mux == USBC_MUX_NONE && !port->hpd_state))) {
+		port->hpd_connected = port->hpd_state;
 		drm_aux_hpd_bridge_notify(&port->bridge->dev,
 					  port->hpd_state ?
 					  connector_status_connected :
 					  connector_status_disconnected);
+	}

 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }
