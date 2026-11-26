Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795662125;
	b=rOrgPC1mJy7urLsEF56OKHTkCaYjrRTMdRBVp/II8Ol/yeFqLkpLIJkY/lFueIU0fhKP
	 qWeHmunIQlwN1kd1x5dME1c0PQYXX3nVphr2Le1S76ZhTU8k7pjtIj0os61Q8gjg5SNNK
	 t50C0DPFlfeqXvwZe5JnWHRkqWrVV+uhTfPnNXjLlpfCJTx9jMsAUZ4OZ+AFNADA77Dcl
	 AILEwngmdN+oSArwCK/IeAV3pyK/J72ied9e36wDK4tYDoLRJzojIE5M9IevlXEHUhafP
	 aGQux6YbPCM0jrjU4lclKtCurZuQhcxMM8FxhkzJ9lfqLcIOJeSfID4X8djfsrGraLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
	b=E9gETqO75YvYwsXUdZrBYI5Hl5IYc06UmhDhUdgo6a69AgH3H2l3p6V6gyprTSYDR9Wg
	 GJba5iCV7EZhtaSy50nazJx4HA4Yd/Ws1+xO5/nAhdhUPRn+3RrbCer0NmdB7/6cPXeiy
	 E2SOzYmO60VsfHwcNlgWSaUg/xrdz5EUTWs4e1QLzgZHYPT+yA02MJJ8V+8OJ8GEZdZ3M
	 ef2hG0LjEz2RJGY1P2WhFKUR89j5eox+6eTbDWyIxfd5wpBGzuURp0kO4mWkQWKRTXZ8C
	 6xqLejnqiZfDGNhZZ1xwErqCgtQaqRmN20+piu0NRh2ISwWAhc63XBsHglClxOZHJqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=jitGV4WQ;
	arc=fail smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7093B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=jitGV4WQ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso8625909a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662124; cv=none;
        d=google.com; s=arc-20260327;
        b=UAdwwTpZykvwqTxMNIh2DZyuxb2KlpZJ+IOMy9sZi39yeXA9M/FY7OETdlOeL+IVBD
         /rmU+uvnQRSFA+t1+IjY1xErbURkv98D4ovX4hSeFObFX0fDwwqrUofRa1HmupbAZLL2
         eOHl79q0DPse7Ci3LaSbR9Gw7vtINhTpiX4mA9JJOu8Tmn6UA3mqJ/+WE5Cl3IO3cLGi
         aMmy92GPPNYLlzkAVhYFeIXbtFEq8+uE92+G9+FeMy6ZcQAPMaVIg/wfA8mXkvliA3a1
         mw1EgKR6gcbrpLlXAv1vIv/pzJ5Jr3zETgbWdty2Vti0kJv85A4V1wPyInVAh2JjLK+Q
         g0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        fh=fonMZGGTV8Vgtv3KOzfhnPCfVS/3gzp3Zld+rQtVc3A=;
        b=CFoiO+UoH0x2nl1kzL3yQDNd/bNyCLNjqViqLRxiw0/tA37+Ko/xbEuNrxK+TN/Flf
         Gtie9RLkkW2MslSD+NWEUcSK6vDpFBH+0MA6Ihysqf9oNWX3xhc0939/allIIjtymgKL
         zpWMRWQu/Or0PhDZBdoGwudugf7UoEhbAuOWxbFuzi5nUi/YKwZ9uabWQ2loChVeG0ad
         FKSaN178ueW89gywCcUe64a/xogrNiYchSUa1jpA9RkMrGvKqRs5TbLsK1vZLMvSabHt
         wovPM7NG06aU67wYuoFaas2CJSZT+a6MuWqW3+o86wJHI1GcwaKjT2zWUH/XbysQaM82
         Bw/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1795662124; x=1796266924; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        b=jitGV4WQr4FT3T9+W4HHzzJyqGPoVKzXEDZsfAX+ERHJSraxnN7DjvwPnhumYhOX8J
         NNeYVPbzCmSfzGl4hrZy0StzlIVw4AwGjFjooCnnvXzSkn/wjybfcuZVYB11k2cmEu/h
         m1QfeR51ImQPOnakDntv9BmpjFRCg1M/1O2BALGojrVcqWqy5wyUSovCKZqS31VUERGG
         BQ7D+FgbLAOkfMoTrd/rDtUFmaFppGXCHRs6kWd0Y6xpZzWZYSxAguBFt2zsGgllBq9X
         zf2VikZ/yZs3EdK82kprKDsiQuYnIKqZfvmazO9H/jh7Ss9Ibh1WYIn1hxqDS7qGJ2yE
         L35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662124; x=1796266924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Trs4YD9ebzkR8KxzgQ83eqnmWNUmqxqu7WDLYndosy0=;
        b=FZqdb0BvwC4S1iJTrFlq7ZmOy41IXf1bN37FbQFRsbW/Zzs62B9oJ5KIFa0SOPV42j
         HZlcSOGurqWki6dRV8gRrwLuqfsHtMLCuOxKV1Z4bQ7bKuFyB+TlhelyBLlFpXsp/XXi
         NZuscLipZ+eLfBf6mKWnIqlZF51o+BoryzCeOirvbY+R3cIK+ahwFl49rXT2vTsrED0a
         7wM3U1uJ6O33IX/ie0QtGpYzlX+h/53/hd/R3YwEwH3v18Dfh54p9V5F/K81XdthXYj7
         l7Km1wa3iyJP/OdxGvmiu6X45xVzC2O+K4myPrFDidRN11LBT54LCJBSRPEoMeLzEBbl
         NivA==
X-Forwarded-Encrypted: i=1; AL+hErEFIISSpEuNxhNQsq34ZaWt9pDuaePNk0eeqgkj0mP3GVmL/cHcsZ8MBct4IJqTQcFPyLSR3tLHikvfMzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RzfetdMzFSm0cH+hgACtxZbywhPyGLYi9OSKtp+ygwn3ukA3d
	y4YkohsZLPZnZ0MajrEwQWSgAebYK4JEiH4eGlU2IeRNOvmDqLyfHXWRpD/wQeVv50ivSQXJp1R
	ydE7NhfkRqJdgOGPxTFPWLM3iweorR0XfI1WPI/Sauw==
X-Gm-Gg: AZFdTZfgV+THxWkL41OMbeym30q06ukRP/VSCfdaNqGj6Zv7TOBePYLXMdiy0TkUF1m
	+5oNwHkHgknxpGp+a8DFW+QEmgEaFK0R4e0TIntWCLjQDlXxGUXyN2DOr/rH2ursnfM9kpmh/EF
	Io5FQpBBfSGFJ1565GtUHfEIBqn7R6WcIuuzCYUo6H++YmNCiiwGJm2KdA92kMDdfQ/t0O9gbPV
	BRdgzurkyEoqYuZ7nuNMb8z43NJDscZkVyvqp1UdLXNjtW2ehbX+i4ffNCMJH0/bd1YuHiWw8yx
	MW0P2UbZQzR5uidNYHaxYvi68qZxGdb7KMTFj1p0mGJvuAa4JK9Jq703PbM1tRhY2MNavoqUayu
	v9uQmOWJ6zo6wVnAX7bg892QGu3rgoZfWNRxsBD9fbM2qQpIVc0ow/HWAnTIcn0iqaCjkKuQ=
X-Received: by 2002:a05:6402:210e:b0:6ba:9c98:3f4b with SMTP id
 4fb4d7f45d1cf-6ba9c9840b3mr9977001a12.27.1795662123877; Wed, 25 Nov 2026
 19:02:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121073652.410916-1-jure.rebernik@luxonis.com> <179559320769.3135.10021676764558133789@kernel.org>
In-Reply-To: <179559320769.3135.10021676764558133789@kernel.org>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Thu, 26 Nov 2026 04:01:52 +0100
X-Gm-Features: Aa3M54peN4hAIHnDOSMeix5BdpvlNnY8Qphl_DV5K2Keja8xiPJqidp04Rp5M78
Message-ID: <CAD9jT+p2nvSpNJ8TA0QCJKW-_8ZV8ceNEXRTA7e6OE42RpDkhg@mail.gmail.com>
Subject: Re: [PATCH net v2] r8169: clear RxOverflow before unmasking interrupts
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 07:53:27 +0000, Sashiko wrote:
> [Severity: High]
>
> Should the RxOverflow ack depend on napi_complete_done() returning true?
[...]
> Could the ack be tied to work_done < budget and moved out of the
> napi_complete_done() condition?

Yes. I reproduced it on RTL8125B with threaded busy polling on eth0 and
the NAPI thread starved by a SCHED_FIFO task for 20 ms of every 200 ms.
With v2 no frame was received for the whole 40 s in 6 of 6 runs on
three boards, with IntrMask 0 and RxOverflow set, until busy polling
was turned off. With the clear tied to work_done < budget, about 65700
frames/s were received in 6 of 6 runs. v3 does that.

> [Severity: Low]
>
> Is this statement accurate? In this tree, parts of rtl8169_poll() come
> from the multi-queue rework:

Agreed. v3 says what changed since v7.2, where the patch was tested,
and that the changed lines behave the same on single-vector chips.

> [Severity: Low]
>
> This isn't a bug, but the comment presents this as general chip behavior.

Agreed. In v3 the comment says "At least the RTL8125B", and the
changelog says that the clear runs on all single-vector chips but was
tested only on RTL8125B.

Jure

pw-bot: cr
