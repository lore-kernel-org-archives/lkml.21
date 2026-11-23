Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473815;
	b=N/uNBB/McNw55Ws+SY0Ih28gCyAenpby/jQfSCsXpeQdKCD3kOjsd+ma2Y8X0lZwA34b
	 tlTd7aOc2ELLuADEDUQbdyMta32sF6zvRINp+jm9NuGi/iACUJ2q/P8pWvWc5S42OSUFA
	 6FtW2WE2oOebHIyU6Bnv2l2eq7Uokf+i5zZdPIdlGmx/JTYtctubg1xjFZ7y883+SpD4E
	 aQgbMAF8cPRlcZqBtMVRSScTYHlW2jRBiT/ZYJITWjcrxlNu41bYRGS0HOClktBAx3s0e
	 g0w5LBVrL0D1yUSxoNMl9CeHsgJqBDHByi8ezNGGQP3oKfsDK1934tPlMT/pAp633Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
	b=NG+Xned7G2B4LTXZ4DQWhDIarkjTluHhHv0ArITtVs+549pRyH4FojhrIG8sDlcbbOJI
	 vSUpvaXcwk3UqPeshSucv9rN0OF1ai6AtW7deKdVyrH2A90xI0jWKM5karnFavs3DWRE2
	 m9n2M4kQlzHNIobfBqm7ujQJM8t/EJGT8eNCeoLbRdvSsjHyQGBWY0pCQ8xv7dDdKVr1+
	 HXv2x2SltTV56O88/Ny6FQZZmMGV62W9y4Q+HloH9O7vPeYqz+hwEfjBAd7+T6pL2jSC5
	 TZgzwmG+89sCYEMU3UHja1FIfqk1KSBCDdFzW6Z8VBXaavmTt5AAOfXR/dF4wjoVV7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t89UtQSe;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0DD606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t89UtQSe
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b439e37813so1666497a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795473814; x=1796078614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
        b=t89UtQSe4/VuHG8pw0NtGtJd/7Lw9GJ0OKrPyY/Q0IioDd3ZOJ43WUhnoEBLJ6GhTv
         IERzqfWlTzWwT6SrTW79NrpOgQLZpEoiT8eGY7CTrCwOsZHqlVOBVZQjcTahUUCO0Ynb
         cjQxPkCMSaH2yldtBD3AgRPBi64ASUp9E9EFBPG8RKW9uSELyHQGC0R2QF9Uo2eWj7KK
         p8lzRjz8QadYc6uKb3ujPFA/TphrW9IVtIxYKw+t7wl066IFY/lo+l754MS2YJqOvaIb
         ZLLNPTHbbGGn6ZLcf0t4c8NRMNgeXziRnAAEpImRuNf4Uy2LlFcrmkQdXHqzn2sPe/y1
         Yy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473814; x=1796078614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
        b=1vu58bSJj0hDHWwz3OyV1TTuVqawTYZOa0ExYH3b/w8xc/lz768F4HvpGga66wbTg1
         9LHaaI2eBS4fyFHeHa9g7eRreQevPFvCbseX7VJFw1U0BdVPqBIpNrOTyFGgCxmNVvm9
         JBLVt+448VFJ7wvJJXI2HRwpD+1tflNEZF2Jv8xKJKPJJP0WTDOuvRzAhNGBN+4cX7Hq
         4TcGkrsf99o7088w4/NQVMP5CTjYLmUZq60BbrIU94kRc031KRwMXvPslWORyejYfIYy
         Tm1E5kCCCNA32ii+c1sDVmBGL0IBMtZggbOAr4Zj4XvO3gpb0qvKlX78lvG7ztzO1Zu0
         I0ng==
X-Forwarded-Encrypted: i=1; AL+hErGnIr2G7UBtlWQcMLO1pKNZCjgOMZhy8gXFQEhHnofD+vAZFFLsnuAQYu/57GrBcNYATm+4piwbRJoC0E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VAGLgq2tnzNXKCQjY9gImRKEel3RR+Grkm7kQCw9AFGQRSYjf
	Dm23FjdBBUPUlZoCYWVcNfvHxPtqRQGHXZRjMBLIowN399xOevAs2Ym42Ujb9mrRrSE=
X-Gm-Gg: AZFdTZcHz1ilonJkJb3dB38HlxH4cWLIekpgOTVnIqe85fC8CMzAVxmWF+wvwWWN8T1
	UjQMvAGaCQMVXAqE5D9fjKwfXBxua/VuDM8TgrzwBY3G7NjesbqZ9EZb/YawXa2yjTmcV23QbZ1
	AobNwOI1xkfhasepcCI6xCuq74YUxGhnQwwxGrQ94AfzUuXJwXAUwmLeo4MmoOap1bSILzwneZ8
	K2tUaMsEXJYnwfr4f4LQo86betsaz0phB+JaWuOIwIz3/u3l3zsVMf80wg9NzZVFxIbZECXby+A
	fHrHVEbrbnbOTe/IkA0UVP6PwT1jhkFxhGe29Eg9PoY8/0j16EsaK8RgBhNVA0B1heYFiDAqCei
	yCcVGYfaXCnoav5spDoD25JTym3GsWgOnG3rVrLkWdpC9i/9/VBZNb+e0ryEveFtwIDLXbvyxXg
	KqG6wTaelsoQwEaJVoooC1IbQHMOl+xqUm4w0F2kCG7/sxDKhRA3MstZcTSTlhI+oX079mXlhQq
	O6B+5vfBckuz+9idLGZHPqlP5Hg4vzKoTmESHRUZzA1E2K10+leGoppIC2USxkBZ7wU8WbXeHKN
	5KehAZoOv/YcoxwueGDTmDMEAodSwCgtD3s1+pT4Yqxtg/pftdZFLrUUmcLrH8nb
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr11533973a91.5.1795473813724;
        Mon, 23 Nov 2026 14:43:33 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm7890610a91.1.2026.11.23.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:43:33 -0800 (PST)
Date: Mon, 23 Nov 2026 14:43:31 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion
 never arrives
Message-ID: <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-3-joe@dama.to>
 <179545865940.3135.4199576162321798829@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179545865940.3135.4199576162321798829@kernel.org>

On Mon, Nov 23, 2026 at 06:30:59PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In __hwrm_send()
>   (drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c), when the HWRM_DONE…
> 
> --
> 
> bnxt_en: check HWRM response if completion never arrives
> 
> Before this patch, an HWRM_RING_FREE sent over a completion ring failed
> if __hwrm_send() timed out waiting for the completion. With this patch,
> __hwrm_send() checks the response buffer first. If resp_len is set, the
> sequence id matches and the valid byte is set, the command is treated as
> completed and goes through the normal error_code handling.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > index de02d1baa7514..53667c0c38aaf 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > @@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
> 
> [ ... ]
> 
> > +			/* The completion was not delivered, but the firmware
> > +			 * may still have freed the ring. Check the response
> > +			 * before giving up and log the state.
> > +			 */
> > +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
> > +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> > +			if (len && resp_seq_id == ctx->req->seq_id)
> > +				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
> > +
> > +			if (!valid_byte) {
> > +				hwrm_err(bp, ctx,
> > +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
> > +					 req_type, len,
> > +					 le16_to_cpu(resp_seq_id),
> > +					 le16_to_cpu(ctx->req->seq_id));
> > +				goto exit;
> > +			}
> > +
> > +			/* Read the rest of the response after the valid byte */
> > +			dma_rmb();
> > +			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
> > +				netdev_warn(bp->dev,
> > +					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
> > +					    req_type, len, valid_byte,
> > +					    le16_to_cpu(ctx->resp->error_code));
> > +		} else {
> > +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> >  		}
> > -		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> >  		valid = ((u8 *)ctx->resp) + len - 1;
> 
> [Severity: Medium]
> Is a set valid byte in ctx->resp enough to show that the ring is safe to
> free?
> 
> The commit message calls this case one where "only the notification was
> lost". But the commit in the Fixes: tag, 74608fc98d28, sent the
> RING_FREE response to the completion ring so that the completion entry
> itself would act as the fence:
> 
>   "The response will be the last entry in the ring and we can free the
>   ring after getting the response.  This will guarantee no spurious DMA
>   to freed memory."
> 
> The response buffer and the HWRM_DONE completion entry are two separate
> device writes. Once token->state is BNXT_HWRM_COMPLETE, the existing
> success path reads resp_len without waiting for the valid byte. That
> suggests the response buffer is written before the completion entry.
> 
> So a set valid byte may not mean that the HWRM_DONE entry has landed. It
> also may not mean that the TX/RX completions queued ahead of it on the
> same ring have landed.

Agreed. The valid byte shows that the firmware finished HWRM_RING_FREE for
the TX/RX/AGG ring. It does not show that HWRM_DONE was posted to the
completion ring.

Michael, can you confirm that the firmware has stopped DMA for the ring
(other than completions to the completion ring) by the time it writes
the RING_FREE response?

If the response is written before the ring is quiesced, then this patch is
wrong.

> This path runs when NAPI has stopped draining the completion ring, for
> example after a TX watchdog timeout, a lost IRQ or a full completion
> ring. In that situation the hardware may still have completion DMA
> pending.
> 
> Before this patch, this case returned -EBUSY. Later in this series,
> "bnxt_en: stop DMA before releasing rings the firmware did not free"
> makes bnxt_hwrm_ring_free() count only -EBUSY results as stuck rings.
> __bnxt_close_nic() then calls bnxt_stop_dma():
> 
>     if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
>                                close_path) == -EBUSY)
>             stuck++;
>     ...
>     if (bnxt_shutdown_nic(bp, irq_re_init))
>             bnxt_stop_dma(bp);
> 
> This is the close path that reaches this code:
> 
> __bnxt_close_nic()
>   bnxt_shutdown_nic()
>     bnxt_hwrm_resource_free()
>       bnxt_hwrm_ring_free()
>         bnxt_hwrm_tx_ring_free() / bnxt_hwrm_rx_ring_free() (close_path)
>           hwrm_ring_free_send_msg()
>             __hwrm_send()
> 
> This patch returns 0 when the fence was never seen. Would those rings
> then skip the stuck count and bnxt_stop_dma()? If so, bnxt_free_skbs()
> and bnxt_free_mem() would release the ring memory while bus mastering is
> still enabled.
> 
> Also, if the HWRM_DONE entry shows up late and NAPI processes it after
> the token has been released, does hwrm_update_token() just log an
> "Invalid hwrm seq id" error?

Yes. NAPI is still enabled at this point in the close path, so a late
HWRM_DONE only produces that error message.
