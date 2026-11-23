Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473523;
	b=cxseKWOtWXFG8Tq/7m9qXz8cgdp7npmzBqN5JAAMNV+U+/kNSuin7YcdO97Gts2JZYvT
	 /o5uxD0VzG4Z4i7siAMx8Y2RQsQ7qChjBo/Mqnf4hddYo8zeZevWXe6nqQZZNTCKpT9pL
	 NYbyZ/sP4IE+h3397OqPHH/w7cDm+xb5m+WKM3s14quWsIu/WIh4CadK32036ew75cjZg
	 X2aHdo6o/gxAbsF5A0W7u0Y/TtBN3zUedZIh8pO2AxKrIOx9PbbDMaMOxYFkfSsifrO8s
	 yemfk90iNCXlNS+J/GY9cIvD1VtL6rOLdPA6zHEt/0iuU7nhNp/6Zx/ewQBtHyBK13Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
	b=Rzyt6miGa2LlZJtgs1B08sYVfQ1MbGgAJytvAWP7Q3UAVI4gKciOBiRmDBJ22rB3OmSy
	 BhClb4BXyWQ5IfOjojPUo8pR7fQFayYpRDBrTibJWAKLNm0IJuEEUZsirYWT03uwT0dYV
	 3bmRGAnrmwEVqMeAzWpc5ZUyWo390u2zmEUb0bS5rQiptA/TT4TaNylDXfp0z2IOckELg
	 1xW6rOjOprddyzhfNngvJd4GVK31vcurknRxOGkjLzNbqAG/zfBeIeasjTdpsS1L2VQsy
	 8TjuvSUEsHCPL5WAIfSLG1+0PeSvY1clKxYG7fOcRo6t1WmgDD6FOlJTM1FH6+9K9lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=zyiUCvTu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF2606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BF2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=zyiUCvTu
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso1400918e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795473521; cv=none;
        d=google.com; s=arc-20260327;
        b=lqbZrpHsTMHbFCY1ZIxO3cUDbMucW/TYshiSiRWKJiQpB08rXnh7cXueltMnw8HSPX
         28b32PI5sBC9l1pYJAHqL+W14L2rg6zUA/SmCZkQPUQfCQV2UVEiQsY54M2GgsraMzFw
         nVYWC944jlfzcFz3eJSqgAhkR1MjY2MED+3JUSSlVOTPedP4ESGEVZNXd3t4mp/3oBS8
         aaQgpneJb2rSK6VFm2j9CPmeL6WBRn6fTYMu4oxN/hscC5wdQK1shAQ6Ggcu6/zsyHrX
         UtorJxJR9cboxiuggJoqZT6e+PXj2BJZsC+BYoAwwoM6jHjM+31hxpx132c3Z8sx4YZe
         7YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        fh=+VAA69/DlpXKnqyuNL74/Wo6Ymlui5Ernfug8+ppujY=;
        b=fbr/gKksDzymi2XUL8uZu58CRYRmsxPkQoQkaIbYwNC40l7H8fx0JzbvIEI6YRoxdH
         dXbfFb0s4EAItiUpX4kWHFvrRxo+wGDkphlBwGaBkl99IUE5WhoMjalXP/VMwLySbNIW
         dn7JIgOaUe+r2BaR0TACsivG+kfXId+OjyyfP3heLEPUPDSnTEklauKy2+DId4gRtkko
         M9GNlthVNRTDX5SllQR0LZ81rJk/hGdgx9zZ5WzdvbOlzwxON7KJ79lLXNKUT3HoCZQ+
         emPznnCcPydzO09YlLr7BYsg0z42Gn0KNfDJAX/i4z4wnq/8dqlI1sdo/JwlPmR7msAw
         5YsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1795473521; x=1796078321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        b=zyiUCvTuUruIC9KA7f/TKpjXXvuqRdzyyyrawPTRvar9oKK+YD/nxCoP33rGakGsav
         sVJ8T1hmCDgtZ2JwIyRdjkY8XfyO/0ttbF/16+Roobqw4ueTWztO+hRTpK39RF0TbRMu
         GHMKhS4DubOZklj70d+rMG+P2cp+iMlHMljBdjmehin9OoDpP3DNGbNmzG47jJ6KN6ho
         Dy5oKTNcCyaDipy9l2RsVqWSfXZRs5MIVqMqTjIjt9Xw8b5QCjTEiLhgNUkS7ZUQzT9Z
         a1UdIhaowt9Qr3ksyQErDAyEvTtAnO1e6+sviza4NqZYQIlIVjK5g652ikTPpAbrHzWv
         Wh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473521; x=1796078321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        b=p10MyTXggJRecOKl7E/xYosthNpoSurk063tAJgrNX83XKn/jm+wq+kGVQ2hPLe/A5
         hTlCMBrkGrQS1lr9lkHsEipoVxAOjL9TIDkdrwBrQha6PUEtPakqur7Qdgan74UxiMg4
         g6UrgES0yqghrJi9vwphqBnttWoxmO6DW7gd8fK0/4jw+3mJAXlOv1nhe1M3mAklgMSQ
         oqEQVsCoYvY6y3xmrO13UU2ghqED1EJjvRzAyButyxD+K5AxHCAhc4ETE7tnS+eglk5e
         aUHRFshrzkf1iRFiMyfj46Sdlgf5Bzts9eS+rfgBxtTEAFZQ0qumHFSzl8x26VFHbwwv
         QiUg==
X-Forwarded-Encrypted: i=1; AL+hErGjwHadIYjnv2Rz+XjOAjouX/kLG8PwTdPu0IMNRJGy6K+p6U1AXrktlyez0WtMSPMTOkbb/QGZGzUqA2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z90J12jt/KetXLyv/bMNZdxypzv1pgsC7Kz6R3CSGwEPm7WYNgX
	oHLN48m2C1kFPJDaFZE05BHxgNhU3lTr/mZawUTjLLEn6EeMwHQE/KTIeNN+HcXEEqNEYYwUmUR
	VjnaNlzfz9vLHgBMAq++XwLoen+ZUMu00ZrbwQg/jMw==
X-Gm-Gg: AZFdTZew2o9C0yHfkmHenICupZGyRnkPlBo3FScZdnuwyIReweMwUrIh/Ygwobvp073
	cyqPHtv49TB5WmdUWZsWU19pIPZP/3sfe/VPhW50TbcicTuOzaHpeBPpObOjQ+HbhRW7iEKdSpx
	CtOeRQGebsGCsnC/Fxrzv2oinizqsKPDrD0+t2C6bUmG4iOnxIyiy9rPmDjyTjr1LybDQzPQlw3
	JA3P53jHoxRBesfBO1dwYUVVc5Q4zvZp17DvUI9xfuFLJbkaWaYJnNOhZPpkZI6w1jUcBToqbVc
	JBykRdp3+gU54Ol6m5RIcEn5lsSnq/3DftFcJQIDPhmkuU7jY3iC5BECjILtqI0pAJ0DNc7KMM5
	OumAoK2k/OMVgaxkyBT1c2m3jxn6x/MEyaNLaFsAcXM0Qkx9uSF8lvoHSGubJR7tKWFrImTGMEX
	tFYDJ//TujcWUz4Akv1xDuj20OwIKaOHwGLCWNMrQJP7UFhLR5AXAscnWGFzY5SQiv7QoNRy0yq
	IkwCS9ekyFqHkRsumn271SjG6MWb1TEXF+Mv9I4SMadzfzVVaVUnG+OEJoTwpiSJSnvZRdeC/i9
	Po8=
X-Received: by 2002:a05:6122:4b88:b0:5ca:fc48:5634 with SMTP id
 71dfb90a1353d-5ee8aed35femr6594776e0c.11.1795473521432; Mon, 23 Nov 2026
 14:38:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116183519.3314837-1-rjethwani@purestorage.com> <awSQENPQBd7ogyyA@krikkit>
In-Reply-To: <awSQENPQBd7ogyyA@krikkit>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 23 Nov 2026 14:38:29 -0800
X-Gm-Features: Aa3M54o9TN-CRk9fIngUEHWt_m8XYLfhqb3UWdu_Qp60Que949if8U9zCRR-XfE
Message-ID: <CAKaoeS15yiScYY3uokc=DR++M-R2fyeUoK-qAtMPpbkyaqY-rQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] tls: fix socket use-after-free during device-down
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alice Mikityanska <alice.kernel@fastmail.im>, Tariq Toukan <tariqt@nvidia.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:12=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.ne=
t> wrote:
>
> 2026-11-16, 11:35:17 -0700, Rishikesh Jethwani wrote:
> > tls_device_down() pins each TLS context, then drops tls_device_lock bef=
ore
>
> pin =3D hold a reference?
>
> > switching ctx->sk's TX validator. The socket destructor can run between
>
> Please stop calling it a "validator". Those abstract references are
> just obfuscation.
>
> > these steps: the context survives, but __sk_destruct() frees the socket=
.
> >
> > Switch the validator while selecting contexts from tls_device_list unde=
r
> > tls_device_lock. The destructor uses the same lock for its context put
>
> Which destructor? We shouldn't have to guess which functions are being
> called.
>
> > and list removal, so ctx->sk remains allocated through the switch.
> >
> > Checking sk_refcnt would miss sockets whose queued SKBs still hold
> > sk_wmem_alloc and require fallback after sk_refcnt reaches zero.
> >
> > Requires commit f08d8c1bb97c ("net/tls: Fix race in TLS device down flo=
w"),
> > which moved the destructor's context put under tls_device_lock. Include
> > this prerequisite in older backports.
>
> Can we add the dependency in the Cc: stable line instead of bloating
> the actual commit message?
>
> > Found by code inspection. An ASan harness running the extracted teardow=
n
> > functions with userspace shims reproduces the UAF before this fix and
> > passes afterward. Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).
> >
> > Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device =
goes down and up")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
> > ---
> >  net/tls/tls_device.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
>
> Changelog? Links to previous versions?
>
> > diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> > index 4cdfbb57ecff..866193a506d2 100644
> > --- a/net/tls/tls_device.c
> > +++ b/net/tls/tls_device.c
> > @@ -1345,16 +1345,19 @@ static int tls_device_down(struct net_device *n=
etdev)
> >                   !refcount_inc_not_zero(&ctx->refcount))
> >                       continue;
> >
> > -             list_move(&ctx->list, &list);
> > -     }
> > -     spin_unlock_irqrestore(&tls_device_lock, flags);
> > -
> > -     list_for_each_entry_safe(ctx, tmp, &list, list) {
> >               /* Stop offloaded TX and switch to the fallback.
> >                * tls_is_skb_tx_device_offloaded will return false.
> > +              *
> > +              * The context reference pins ctx; tls_device_lock keeps =
ctx->sk
> > +              * allocated until the validator has been switched.
>
> I don't think this comment is helpful (and again with the obfuscation).
>
> >                */
> >               WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xm=
it_skb_sw);
>
> --
> Sabrina

I sent v6 before seeing these comments. Please disregard it. I=E2=80=99ll s=
end
v7 once I=E2=80=99ve addressed the review feedback.
