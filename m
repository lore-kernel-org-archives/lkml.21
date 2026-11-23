Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438393;
	b=Fc1ledm5yHyQMBOmPX4pN5MRlVoZFDmyx2gLZ13CT7j01p4Odsva/2x1GesEy6ldjqWq
	 uyjZrI+sXUYI/BU7huNhnPVHUwVAC2izhp7qWaK3fad4okz5neA11Zjs5nFZ55HWQYyLh
	 qs5lg9C0VKrOUja4KsQQ2QNKj8kZezs4epzxJ3KVtU3muU+bf4cP16H0k/Y7tZFUNiunv
	 zJSGvMF1rGLLSUI35RLDoBnbtrhmkcoUmdqIzk3aW15/6GCeIh7PGT+YNCbvjt0obQE5V
	 sx3iCvtOQwaL5J2Bhr8dJK1wnepdAt9fsVAQh81MSqbmyuWS6NOu/Ss1BrEaN1SB6oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
	b=F1VHkjxfhOG4l/PqbkcLgSwxNtu3h6E6R/CnMeFDtRjRbkQfyqDrjhNz9JBmCHQ0QXTV
	 WLRSH7VmRj0pLTGwfBu/4+nSxdS/jsNWza6ej2AYzMXmuU50QAP6VAMZTni7pVFT7H7JO
	 d2bdEP3t92oiuAtH5qf3469mkq0FlFwnybln0Eqgy957MjhdUtiYGggF5C6QtagbBoatW
	 HGZylIskigneEA4Zrh9Qz+evdhmlBYHo46g0y6E79l2E/xkPUSo6Q3udlC+CVRCmTmOnV
	 uW+/PqRWoXPp+8OiW+cvusSbXt2xRL/fwJhWU67UxeOyvQRW4kN3sUR5BhfyMKJwbjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCI4vVZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02068606A686
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02068606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCI4vVZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17548035e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:53:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438391; cv=none;
        d=google.com; s=arc-20260327;
        b=kU0e0LmE1Mv3x+wmudcDRWCLKS96LjeG5xir6LLggfixUa9NyS2jAe4v1YA2ec97rL
         kzMqBSt9syIg4Xe2XkuJQyPyUriCz1lzuVTStkDyZLJDmNsNnriYSEg4D02Lhpqz/vPR
         wamRD7BU5O3hjI22k6/r/ymE6qphp3MM8KhYYTn/dLa+6NbOxkpDB8fIhB9tpak6jej9
         rDn9DMYKYLAUX90PzjuyiL5W1H3XE7pBF0zWZm+ppQcjxhgGvq+jVQYNPNCV060mVAPe
         I3niGtOcz+GkKb0RIWhQ14CqqtF8d9jfIQnaRItU696WqT4c6pP3DnWQgjifnKcos4hW
         LVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        fh=BXZe1VMQsMJL2Vj79JcNdr/uA5Ams0bO4CTrLToGtc4=;
        b=f7bUglRE9RqIcAKAb1IFf9ofqV4GDlwr9fZDj6WhhGFWIW0RP4zrH6ALXLgcN5CLTz
         X3Snm7epgptAGdCO/OtK3idSg/9o3SQwNB6+ADj/00BLoi4l5QKU7CCLuwsQG5yJX0wY
         U7iZgqXjhlWSIwvP7yOPP+dgwZqUKvLzHnfdasTNMtZgyGwgM9PZN1nBPdcEepO3MNT8
         ETEaBdRUSYXAfRZjhvFpVYdyy6+tiKEwG9CHQ90uzfacs6jnMos3ZyyH0IMp9ffE0NBb
         I8yqih81qzwq5IcEcKEZrZV9PTf0VsSrniWNOGuk11HLFF2VVlzHPQEijxqAfTe7l1jM
         K05A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438391; x=1796043191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        b=lBCI4vVZ3AImfYVQwelGg4Le5vW23+tuGC3/xUsa+Fb+3zMSryvMsAsx7A5A5phm8d
         Z3DO+OnEVdedmkOlfKp4jVpG84e1JYyv/HXtlx+R1KrgmOtgn2IuUIbiZg7LDwS4jSXw
         TdJDChey1AkpjJRQMCrIglJG5yyLdf/nnS1q+clZflq6Oz2xRRpMdRJEZGp8++oVUdsI
         e+UGcctv4cJZNA5zKAowM1Aub2jLqsNu9F3FXpsOcJ6n1D1U5tAfbxHNs9dm1M/bc587
         wUYXEuAsnYCvnygymyjLmtsplN6AIYnvPrQ8hdlIJARNmVKZx4K6pH0+QlkEV5isnmxg
         /yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438391; x=1796043191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        b=p1f47RZUTePC94Ic+EVKtMecmZnzxI/S10a88YEV3SogEx1o2GQdlyB90XyaKa+mrV
         kdy5q964jNvvvnEZut+5OKZGTQkFsZeykqgugSQedxYzeJ38N0glf94KO/KTMEGPKZrU
         XW70aQB5SPmYvgHgFrFbaIIKtS+DAAfag5KeCwuigq26J0h5iFfH9AaCHbQu8yPZMr9b
         4aaYHamPAC88rTqP8EU3NnwDxqRA7F8QQ1YwEq2v6guXEhkpsen/j8PdBk75A23OI8jG
         g68hKtPg/EadmGPNU0AhLCyUfCA5/Vfsi/ec6BETkhYlWUbNBupOZt0NmNyN9Gj5dTMX
         guLg==
X-Forwarded-Encrypted: i=1; AL+hErHObVLhXvs1xxwgYKtBDLdSPfVroutp5OaJ5JSL2XV5ug3NJgwm/CnFHcDT8lC2iqhSQhruOFkI778Wr0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YiQBATLdtb5w84SUH/6bnjL1kuvmvebvEU678k3vZEGkyLdMy
	I4juhbunweNhXbeK57fg3foEURar278JhRsixPN9nSQVKGNjZTrLvdlx4+283UELforiK7kU1NY
	UVtz+LHuqSOSNavdttaFN7r7GOA50DRQ=
X-Gm-Gg: AZFdTZdr9D1H4BCoBMWxdjc7T1c2UbmmIa9tO4dE4g0IufYOp7+7EYNISTZpnddwCOX
	cDsZszolHjAIcPxSdKnwzwi++LT50eldU0nT3habxnBwjwQX1FmwdiC19e7EL36PgQSh8F7zD2z
	N4yO1XTP72F6to2uhS0hFE4Yg/tGk2IqKFtC+0zCffCh2u3r+KBJXl5vDHXCQG9/+za5Qn73w8O
	YKdRHoAPlkNp1QKUz+AeeoOpeJupbtNz7ffSYl9k5PqPjhxXgRgi5/UIpbQKnuPmuBU9tiWWzrt
	Vu0B2pjfxTuJ6RPfOX9ZHIssZbQgWd0RwIMGc3zgfkLSD50wQe0jcI/lqu5nQEvfANVsYlEsV58
	cIW1yxBaSPAMctGsTXz56VNa0bI8HlEqHDYziAclO/T510qqcVHO92bY5IeA=
X-Received: by 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id
 5b1f17b1804b1-4bb88806287mr176227705e9.14.1795438391173; Mon, 23 Nov 2026
 04:53:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910105359.12915-1-syedtayyabfarooq08@gmail.com>
 <CAKD4hN7z8Mf-EXJ9DUhDuxzbbEWShGM1aSQ2=5SQ=8F1wfVprw@mail.gmail.com> <2026112020-reviving-pretense-0353@gregkh>
In-Reply-To: <2026112020-reviving-pretense-0353@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Mon, 23 Nov 2026 17:53:01 +0500
X-Gm-Features: Aa3M54oQxzf2RUCXt22miSbwmYa7KIxFZwFzrBd-ICJIDPaFDZl2cuGB9KQ3gEo
Message-ID: <CAKD4hN7AhdD9qC9-7_w-0Xqv84kR33dtPF8yq+8NocjwNVyNjw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have gone through the concerns. Both points look valid, but I believe bot=
h are
pre-existing and independent of the lifetime bug this patch fixes, so I
would prefer to handle them in follow-ups to keep this fix minimal.

> If a concurrent USB disconnect triggers gserial_disconnect() while the
> lock is dropped [in gs_open()], it will see port->port.count =3D=3D 0 and
> call kfifo_free().

Agreed, this race exists today. gs_open() drops port_lock around
kfifo_alloc(), and ports[].lock only serializes openers against each
other, so gserial_disconnect() can free a kfifo that is half-allocated.
From my reading of __kfifo_alloc()/__kfifo_free() the likely result is a
NULL data pointer with a non-zero mask (NULL dereference on a later
write) or a leaked buffer, rather than a write into freed memory, but
either way it is a real bug. This patch does not touch that code path.
A possible fix is to free the kfifo from the port destructor instead of
gserial_disconnect(), or to allocate into a local kfifo and install it
under port_lock. I can send that separately.

> Could this wait_event() block the caller (configfs rmdir)
> indefinitely if a userspace process keeps the TTY device open?

Yes, that behaviour is pre-existing. The wait was what kept the port
from being freed while a tty was open. With the port now refcounted via
tty_port_get()/tty_port_put(), I agree the wait is likely redundant.
Removing it changes rmdir semantics (rmdir would succeed while a tty is
still open), so I would rather do that as a separate patch where that
change can be reviewed on its own.

Please let me know if you would prefer either of these folded into this
patch instead.

Best Regards,
Tayyab

On Fri, Nov 20, 2026 at 6:55=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 20, 2026 at 05:41:33PM +0500, Syed Tayyab Farooq wrote:
> > Hi,
> >
> > syzbot has tested this against the reported issue, and the test passed
> > successfully.
>
> Yes, but the reviews for it are not ok:
>         https://sashiko.dev/#/patchset/20260910105359.12915-1-syedtayyabf=
arooq08@gmail.com
>
