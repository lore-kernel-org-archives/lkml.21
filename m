Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196135;
	b=ZcGleVyGdS8ErY9cqb75BifxE2809kc626obid/iH/7r2U27Jl1afcb3TPVL+WSyUPkN
	 neGO6O5vijFBRnhQBnlaMoaF9ZxUAPsP5VedfROcAegA2RWaSt5H0ajDGN/MAhMMvwLOb
	 CUKjJFX4qXNfprHbCSR9v70qtAvx3FzbZKdt8/bgaYL65W3ouo05GaI3hhdsvcUcX3r8G
	 3rIPXoXYpOJtVVcPvcVFFlyN5yr1rjZpNC8mS1k5eGDeCj/wEBosRsrz0++KzUOuAqaXP
	 TybZMaUWmJsZX/84XEdTxtgvN2KuCM54PvASJ4kjbKN1uDuwm+Mw9U7Bz26wuDBJ6kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
	b=Co9VITJfp6fJ2NjSRVudi1vCubL5L5eVl6xoB20nEh6tBz5kSkpc+Zf8s6FqZj1NcNl6
	 UbKeNRJ+1LPAYmgM3R5Wr0VDP3jbTzkx4Y7nHYdHk+VMvMd+IfR7PmbXHRkTHd/+UBg2f
	 QPp9XbfhWIaZs6fDXqLWucpsQEMBk7cyQoeRkYylYarE1TyNd5vpr9TZ8NXgXnF4QGh53
	 17cQr3Eb0IXO+gOtVsPtbHhkc+cXuxCKpvNyagJgqlUbzFVyv/iEzm9vAsb753+9KhPl8
	 /q1dUg0ljKvYI9HjBklAJyJL1HBlVEHPOHg7605ziIT96HXQGHqnq7qARRMLhnvhPpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pxvQW88O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B160A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386B160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pxvQW88O
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so374441cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196134; cv=none;
        d=google.com; s=arc-20260327;
        b=YHGCbcQqIveRTvl1OWQdWFRPM9Rz25rf1N6TGNOII9f3g/hZGzs7ubJyQvsCahMk2b
         N+7skHmyu+5AjRCmCS1GD9xd3254x+9IxgOtpBV4MfrwoXDqdgIqfJOvXkbcP+bVuCn+
         nnMZNYyg1jUFgPhU2ChzqBkTAGPuXdbBhMCn6XkOT4psX0KyegIgNtCRB6j+xRq5ICA3
         zkQP5TaGXVPgvdZeuH0dtITxH1TNIOGYUsiO1L3Ghf5wJyyb7d2auKkvdt1ICWduYYic
         4+9lVPGnaWci+0gNRXB4EiYSeWQSfED9PQoDiAxrAYqRdfqBczZiKFSNimpdfjC1k3yX
         8+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        fh=ot7MfhXwHd6wYWWXzYbsga58XdjJDFe35mHOESXLWGY=;
        b=nHJ8JMURmB/I6gLNJJh9rKFuXZNW6/sQRT27K0TVYW2GGpwXZwK4E9G26t51uHV0x+
         iN4AEkZPCg57B/YuNHF3nliMKqeulVZEpztj1d2mfVXNDts4DPjh0OPsnk+BQLvtSUC0
         gEsVx4RioLFnJItQ15ZHUZ/qse/sDx3CAJy8W5BJwXaw4lBVDcsYoJwaDYrFK7192OQw
         LsbnxQVa0WkQjZTZrNyIN1EMpwplezHGPyV9dZ81fD2NzZftytOH3gH7xj7i7m0IQeUx
         eYSj9mPfGj/DJQmA0qtQTR+h/y0QB3LaM7uGiUYfjvNZMnl7k3qsJnyX2Cv0wLVCeA3f
         Z++Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196134; x=1795800934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=pxvQW88OzCK9s8pLfh+iC9tA0s6dsuBw0WM3uUGfzdpvTlbLRFSPFiHzRxYn2NCPx6
         uKUHYFVwvBv4s0JsvhVgC80hCaeyiB3LRxtUOFaq5rzhFN8uWkWmdU2uO/tGW7kru5vT
         ecJxZoH0lfu/NbzE/6qdwV1M5eELAzxWoEfBB/1dBmXYGAyqxIyp4Ga5Nzzgu9/wPDsO
         3gv+n46jg5SQPseG8iOZmW3WvNh6lEHLqyb/8GmPx0TlvsynlWh3YDE85Cbq6rXM66xa
         /cY6shZV6301KbSZ9YQxIAkpwJoXOiKk7klY2LMbRXrKlY+U/FWzVA+dPa4Ka2JtYUuw
         9Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196134; x=1795800934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=OGbPW6fBc1lUNbch10IP9ysiHHlx/Cz3koHBSFU5EehMRTXTqbLmJ9algFR1F32g22
         FOeRPgoIRivbWgHgrb23qJdbH5FGmeSbU7XfgGCc818tXgYrInSoipbnHpu4UGT7p/nP
         sxMQC+qkbr3Gf7u7oIyr4Fc18+7HSVwvGHX9vgDZJ0Hmb4+ufOouAkuQme04OXeJfxWo
         DxsUuTlKsx5a6pNR+xoF4o2IPGSzu5UIgQypJFY09KzKpDJ8Y33FnbHd4yGjZdPepKhY
         pQ5/+K+rFQiEk85afLxGoAS7yd6Lzka1d28A7qs5hMDTjiMb8s6xBJxPOWe/XGeoux7x
         4nkg==
X-Forwarded-Encrypted: i=1; AL+hErFWDDc7KQ8fZ/BS+U/EduYsd9/PgoM5EuDYaYQMomYsmezXQhrSOrdya/Gj0f91CWHppYAe26xN4J/IAPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ToYNn0vcD/bWctu35BddNOap8l3KLyeI/WzlSdT6Kkbn3FF34
	O/vP56lJB1dzZrx+EYsmrvvL0dRsjp6itHwjWkFkHwDJzAY6FNC/DeNVJsE84gi4jjxgsdNDm60
	XvseGeFmqqFZX0U33Gz2xQpkeQRpF4zsRyrSjuWmb
X-Gm-Gg: AZFdTZcC9Wjzc4uueV0xZfYwv/BCLPtxFN9eEgIC5Sv18lz86xXTDr7HsRiaZxMtYlS
	1GG/DPUeuONW29o2X2eiTr/XufmozITcJxDE5ldBex+rgft7oRkm3QeEcP/sPwIJUIIVWLOhLHF
	7vNPF1G7AEKzYQxwCkwyG7Xa2jjZXjURgv93A+b7cG5U/umF4ToQChDZFWCOTSQdJHSp4u3dhLC
	xKmo+lNSJBNazk3XUNM0AdAxCnTC/zGE7UUgiAyX1SnNm0kh29fn6hT1mn/2CGl27E9XnTKzqoe
	sIm6RMG3ZwdRBVp5QKwJKKhnQtcxiZpNCCebHx6q3JHV45txCtEptdSnwp5jcunNbiB2e6AKHqF
	6mIjEDiNzPqdjcntDtZxYtFmXlByG+w+nljCp
X-Received: by 2002:ac8:5c8b:0:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d790b2edemr23784471cf.3.1795196133385; Fri, 20 Nov 2026
 09:35:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119171014.1534691-1-irogers@google.com> <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
In-Reply-To: <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:35:20 -0800
X-Gm-Features: Aa3M54rHxE2SNl4cgtQPI_-lngqTQPH9-vUoYkTGGDewMSKBXdmwHC7t9x76wtU
Message-ID: <CAP-5=fUPWc5GH6BQsN-+Di=LVb=dYcUu5Mo04Rp2ugsMzjYFEg@mail.gmail.com>
Subject: Re: [PATCH net] net: pse-pd: pd692x0: Return fw_upload_err codes from
 firmware upload ops
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:26=E2=80=AFAM Kory Maincent <kory.maincent@bootli=
n.com> wrote:
>
>
>
> On 11/19/26 18:10, Ian Rogers wrote:
> > pd692x0_fw_reset() and pd692x0_fw_write() return negative errno values
> > from i2c_master_send() directly as enum fw_upload_err instead of
> > FW_UPLOAD_ERR_RW_ERROR, and pd692x0_fw_recv_resp() ignores negative
> > errors from its trailing i2c_master_recv(). When a negative errno is
> > propagated to the firmware upload core, fw_upload_error() rejects it
> > as >=3D FW_UPLOAD_ERR_MAX, logs an invalid error code message, and
> > reports "unknown-error" instead of "read-write-error" via sysfs.
> >
> > Return FW_UPLOAD_ERR_RW_ERROR on I2C transfer failures and use
> > enum fw_upload_err consistently across the PD692x0 firmware upload
> > helpers.
>
> Please write a readable commit message with human hands.
>
> > Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
> > build. Verified by building drivers/net/pse-pd/pd692x0.o with LLVM=3D1
> > W=3D1 (-Werror) and -Wimplicit-int-enum-cast, and with a standalone C
> > reproducer; not runtime-tested on PD692x0 hardware.
> >
> > Fixes: 9a9938451890 ("net: pse-pd: Add PD692x0 PSE controller driver")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/net/pse-pd/pd692x0.c | 81 ++++++++++++++++++-----------------=
-
> >   1 file changed, 40 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.=
c
> > index 7958f5741463..94a857eaa3de 100644
> > --- a/drivers/net/pse-pd/pd692x0.c
> > +++ b/drivers/net/pse-pd/pd692x0.c
> > @@ -1455,6 +1455,8 @@ pd692x0_fw_recv_resp(const struct i2c_client *cli=
ent, unsigned long ms_timeout,
> >
> >       /* Read remaining characters */
> >       ret =3D i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
> > +     if (ret < 0)
> > +             return FW_UPLOAD_ERR_RW_ERROR;
> >       if (strncmp(fw_msg_buf, msg_ok, msg_size)) {
>
> The error will be catch anyway by the string comparison. If you want to
> add a check on ret then add another error message.
> This is not a fix.
>
> >               dev_err(&client->dev,
> >                       "Wrong FW download process answer (%*pE)\n",
> > @@ -1465,9 +1467,10 @@ pd692x0_fw_recv_resp(const struct i2c_client *cl=
ient, unsigned long ms_timeout,
> >       return FW_UPLOAD_ERR_NONE;
> >   }
> >
> > -static int pd692x0_fw_write_line(const struct i2c_client *client,
> > -                              const char line[PD692X0_FW_LINE_MAX_SZ],
> > -                              const bool last_line)
> > +static enum fw_upload_err
> > +pd692x0_fw_write_line(const struct i2c_client *client,
> > +                   const char line[PD692X0_FW_LINE_MAX_SZ],
> > +                   const bool last_line)
> >   {
> >       int ret;
> >
> > @@ -1478,19 +1481,12 @@ static int pd692x0_fw_write_line(const struct i=
2c_client *client,
> >               line++;
> >       }
> >
> > -     if (last_line) {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > -                                        sizeof("TP\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     } else {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > -                                        sizeof("T*\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     if (last_line)
> > +             return pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > +                                         sizeof("TP\r\n") - 1);
> >
> > -     return FW_UPLOAD_ERR_NONE;
> > +     return pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > +                                 sizeof("T*\r\n") - 1);
>
> This is not a fix, just moving code around.
>
> For the rest, FW_UPLOAD_ERR_NONE is similar to ret =3D 0 so there is no
> real issue, only some type mismatch and I am not sure these changes
> should land as a fix.

Sorry for the noisy diff and dense commit message - you are right that
pd692x0_fw_recv_resp() (where fw_msg_buf is zero-initialized) and
pd692x0_fw_write_line() didn't need touching, and all that type churn
buried the actual change.

The only two lines that return a negative errno (-EIO) as an enum
fw_upload_err instead of FW_UPLOAD_ERR_RW_ERROR are:
  1. pd692x0_fw_reset(): 'return ret;' when sending "RST" fails
  2. pd692x0_fw_write(): 'return ret;' when sending 'P' fails (whereas
sending 'E' right above it already returns FW_UPLOAD_ERR_RW_ERROR)

Would you welcome a minimal 2-line patch for net-next (without Fixes:)
just changing those two returns to FW_UPLOAD_ERR_RW_ERROR, or would
you prefer leaving it as-is?

Thanks,
Ian

> Regards
> --
> K=C3=B6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
