Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873558;
	b=BrdDkaMHwlJdA+mpgxyC/B9AYnPh7cUvFVLXZd5ZkAuEP1XusEPv5tdpiub1zCQA4Vzt
	 mg/S23Vgc9JzQ1xeAb+QW9DK15ykT/6qQVtWqGfY2QsGEXBUDvz0ox1uucI+kVEqXn1xX
	 WdqOwfEZ8eJ4eyRLH7Y7o7Tv80gK+Y1x3fc57gHGxTsTSN88W4gCiWj2d/KX5L6gG5WjV
	 I0UKlaJQeNAR60uzcCWIF2ZR0DPKWEtZsPo+l+RAENGvBs2OQWuflK9hMFTZ1bSyVk2WQ
	 HGCY71+Xeep8zyF1Epi9KujlUzOUmLQBwf97sXcxHGzulzGxucsI8+ig6qSP+MkoopQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873558;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WnNjUnhpV2/X/O4OU64HGrypP0u1i3XqylPZ6a6hHo4=;
	b=JQ7lMdF7a1cgey02t33ti+JwrjmYJXW3yk0G0CQexL4ojp93tg0AMcQlhkewfMVeOn03
	 pihJJ68inDAsPQhshGfHmy/HnG3nsTGys+3hgx7ELl7VNIFCqgcUYYOz/Ce7Spn6fNfXb
	 yp4gomDXwmQ4wEAHM1EJDWXVMELn4r/rkWsxkd66rcLy4qw0fUfz3JR8w3h+N/uMexObz
	 swK8yqnDPhnxp/W/njHLOsynQcgti+gjeZSOejlgGoHdZi65lgB7ObWyRimwMWa7fU8aG
	 pnsTrTEelG7UCuCgnPn0Vr4cSdsQk0NSMWEacdodD2a7/neMnObnA5wSC6LEyr7sAWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l/t76jlx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB2606A31F;
	Sat, 28 Nov 2026 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l/t76jlx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FB31F000C1;
	Sat, 28 Nov 2026 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795873558;
	bh=WnNjUnhpV2/X/O4OU64HGrypP0u1i3XqylPZ6a6hHo4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l/t76jlx0ZGzB60H9D0AdIoFlCH0CvtiG+66xIpXgXv/kgP0IApoD0IaDjjBu+iio
	 DdMsTSdYrUnJbgoHMUXEs9xY36B09x1BjtX/UopS54N5RROZ7TlrXTnhpLB999EuOm
	 QezM8k2IvKShB1cKdmyTSf4zMyrEOi+7OlfRCfvd9MPP9BKh6qfqnbh5qIsqxyBNj5
	 hPqvzspgmVUJQmsPQhKQr4ISHLikfeBaXsVzCX54egsZWoTs5ZdChpn4em+YH8sqKE
	 TxNas9UxnBnEPliUCyY/rCIkpYPQGnFyOJwY7cPViRcVoHIogKelhvXel5Rjp98YSL
	 9ZSanq4TSmssA==
Subject: Re: [PATCH] rxrpc: rxgk: round up appdata and authx lengths in
 rxgk_construct_response()
From: netdev-bot+sashiko@kernel.org
To: AeeSec@126.com
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Sat, 28 Nov 2026 13:45:57 +0000
Message-ID: <179587355717.3135.4913063237804466427@kernel.org>
In-Reply-To: <20261127125250.1434-1-AeeSec@126.com>
References: <20261127125250.1434-1-AeeSec@126.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message has no Fixes: tag and no Cc: stable, but
  the patch fixes a bug that userspace can trigger.
- [Low] The commit message gets three details of the failure wrong.

--

rxrpc: rxgk: round up appdata and authx lengths in rxgk_construct_response()

This patch fixes the RESPONSE buffer length calculation in
rxgk_construct_response(). auth_len now uses xdr_round_up(appdata->len),
which matches the size rxgk_construct_authenticator() writes. The authx
part of len is now rounded up with xdr_round_up(authx_len).

> 1. `auth_len` is computed using `appdata->len` instead of

[ ... ]

>    message, the allocated authenticator buffer is up to 3 bytes too
>    short, causing `skb_store_bits()` / `crypto_krb5_encrypt()` to fail
>    or hit `WARN_ON()` in `crypto_krb5_encrypt()`.
> 2. `len` uses `(4 + authx_len)` instead of `(4 + xdr_round_up(authx_len))`,
>    even though `rxgk_pad_out()` subsequently writes up to 3 trailing XDR
>    padding bytes after `authx_offset + authx_len`.

[Severity: Low]
Is this description accurate? A few details don't seem to match the code.

Can skb_store_bits() actually fail here? rxgk_construct_authenticator()
writes up to authx_offset + conf_len + 56 + xdr_round_up(appdata->len).
Even before this patch, the skb extended to authx_offset + conf_len + 56 +
appdata->len + cksum_len.

The padding is at most 3 bytes. cksum_len is at least 12 for every
supported enctype (rfc3962: 12, rfc6803: 16, rfc8009: 16/24). So every
store appears to fit.

The WARN_ON() that fires also isn't the one in crypto_krb5_encrypt(). It
is the one in the profile encrypt routine, either krb5_aead_encrypt() in
crypto/krb5/rfc3961_simplified.c or rfc8009_encrypt() in
crypto/krb5/rfc8009_aes2.c:

	if (WARN_ON(cksum_offset + krb5->cksum_len > sg_len))
		return -EFAULT;

For item 2, can rxgk_pad_out() write any padding after authx_offset +
authx_len? After encryption, authx_len is conf_len + auth_len + cksum_len:

  - conf_len is 16.
  - auth_len is sizeof(a) + xdr_round_up(appdata->len) + sizeof(b), which
    is always 4-aligned.
  - Every cksum_len is a multiple of 4.

That means rxgk_pad_out(response, authx_len, ...) always pads 0 bytes, and
xdr_round_up(authx_len) equals authx_len for every supported enctype.

Should the message describe the second hunk as hardening rather than a
second bug fix?

> diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
> index 77a67ace1d248..6dc4bfd2445a3 100644
> --- a/net/rxrpc/rxgk.c
> +++ b/net/rxrpc/rxgk.c
> @@ -936,11 +936,12 @@ static int rxgk_construct_response(struct rxrpc_connection *conn,
>  	if (IS_ERR(gk))
>  		return PTR_ERR(gk);
>  
> -	auth_len = 20 + (4 + appdata->len) + 12 + (1 + 4) * 4;
> +	auth_len = 20 + (4 + xdr_round_up(appdata->len)) + 12 + (1 + 4) * 4;
>  	authx_len = crypto_krb5_how_much_buffer(gk->krb5, KRB5_ENCRYPT_MODE,
>  						auth_len, &auth_offset);
>  	len = sizeof(struct rxrpc_wire_header) +
> -		8 + (4 + xdr_round_up(gk->key->ticket.len)) + (4 + authx_len);
> +		8 + (4 + xdr_round_up(gk->key->ticket.len)) +
> +		(4 + xdr_round_up(authx_len));

[Severity: Medium]
Both of these calculations came from commit 9d1d2b59341f ("rxrpc: rxgk:
Implement the yfs-rxgk security class (GSSAPI)"). Should this patch carry a
Fixes: tag for that commit, and possibly a Cc: stable?

Userspace can reach this with sendmsg(). rxgk_sendmsg_respond_to_challenge()
takes the appdata length from the cmsg without checking alignment:

	appdata.len = cmsg->cmsg_len - sizeof(struct cmsghdr);

The call chain is:

sendmsg()
  rxgk_sendmsg_respond_to_challenge()
    rxgk_construct_response()
      rxgk_encrypt_authenticator()
        crypto_krb5_encrypt()
          krb5_aead_encrypt() / rfc8009_encrypt()

If appdata->len is not a multiple of 4, rxgk_construct_authenticator()
returns 56 + xdr_round_up(appdata->len). Before this patch, sg_len was only
conf_len + 56 + appdata->len + cksum_len. The WARN_ON() in the encrypt
routine therefore always fires and returns -EFAULT.

The result is a WARN that userspace can trigger at will (a panic with
panic_on_warn), and the RESPONSE is never sent. Without a Fixes: tag,
stable trees that include rxgk (6.16 onwards) might not pick up this fix.

>  
>  	response = alloc_skb_with_frags(0, len, 0, &ret, GFP_NOFS);
>  	if (!response)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127125250.1434-1-AeeSec%40126.com
