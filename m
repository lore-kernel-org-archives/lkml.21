Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551253;
	b=HOkZWfzfiGnjsjzpVBFXkp4tVCCn1IC554iZlQ62Dn8Z1QQHnzWaKVXT7pgZNtniI00C
	 rY/A4DZXHmV4NRzy1otu1lJgRS5VG0OYh+nYjyGV9ZiJCsvV2YeF0gtZbL83gdPCDptq2
	 xAlAZNo1KXP/Di278QcFf/MVTJHs1PIiW+d6/FInmV/4seamcMC0gAu3oAI4KYC0GR+in
	 ocg8xF+jbZOR0/LGJmiS3FO1Lild6rCCuJSrv9GZgzPyADjVP0iO+C5ZGfNM7bk8OCJOT
	 YV3BPE/ZGWeM8tIMbXRIVfvvWOwRfUYpc8/hOfk1ia3ZaeZ2y3eszDaPmD78Suc10Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551253;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
	b=N/DCznN5pUCx3v/x3y51o9NIrdo8xxFkne6ZvKvMfNtly9opSzX/wp8U4alJsCOk22X2
	 1llSR4oADg8GJmBBquNktRSDjcveZIt8wP91cjVDPI7CCWU+0psuCQIYGfkiBn+JVEj0V
	 +r3mq/VkxKhOGA4R/fNweln9bHFo0rpyEhIXKzt2hN1kbGyNXHs7qqrqjebBNM2SwTjsM
	 imPPW/hCe4WTwTcyA1S1UrUACcoJIwYrqgcbMnwmNU5pCVC12yniuSRCUT1UXtGuOl9eK
	 1JCesZg2z+M9roTV8kc+vfIbeH6x7FQS0HEhc1+WVVuWyK8Cn8wa+D9BeMYeJXvjz9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JLIABCZg;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326560A2600
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8326560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JLIABCZg
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so2131381a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551252; x=1796156052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=gC96rAEYD0aXM2LjdxAblJ2DngP4rXXPytVtrdsC6Rp7UFW3BXo8HnDNLNnUeL2QNq
         zxVAuU14RcXp+XyDC4yCF3Pl52lEwlV2ZMsUlUl/JedVbncSrnQFAfWJoZMZsEzwcH5i
         YZhL4qWgJNGzobxBVENZTNeoVpfAGh1tP2drpCo/x1sPbHeM+1nOZ6Va72p47/QsK/02
         AV13Ao9AqSCQythBDL0avh0Nskf4fxGnB4XCNJdP5jLd2nQ9dKgi19fYMsTjbyZE6Eid
         LMhoiRGv83sSudZ2eOFwZBerE4l0oE5O00FUztgWNGDfkCabuw/tOfP28/y5OXQHTsZk
         nxmA==
X-Forwarded-Encrypted: i=1; AL+hErHecHbOG5qy1BJfXBL02H8QRCAdWv54Duptk6mel1QzirEENrD8AIrFnIjTdEDfPduFJS8dvR7pPzWj8/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FHxeLVkz2qPExjG9A+4BwqNth4OGs1r33a1djxQC4e1myScN3
	r/sUctttE0N5V64cvfzlyLm0j8vG3Ze3P6cxzVbKa7mKI4s3c2+lvrKAogPUiUsVIFuh5nYVJzS
	hr8joeIxxLyZ4XhrwTiYXYQTHuSYJ8Lcvh41+QeDZuNOPkQleJrx5GH4CaC3wRV2CH1Pr7RyVBs
	nlfterrHOmhubzTjSGoLNVagwpgdBxK91usgWUeR8P3LHFSzNjzFKqQswZK5RjQFmBDq3hZOIcr
	0s0mJYmTYqqtSfuBhh3FUc=
X-Gm-Gg: AZFdTZe5qHq1f+nVQuIseB4PX+O6NMUbijZDmHCR1dYDkd1Ral3SzmnrNzpFyeGGYoD
	oE6pwQSTx84mxOupeGU+y4abxjuXkv8oZ8DCU+3F4PQ6VHTXJDmcao1XAHvB7X0JuS41df6uUau
	ZMWpratP9lwIuN0IFignuU09ocM74ZgDwSICwoaZ7Jg/kTSM2HBAoHrQbv/vnm5r28cXOyAsu9R
	WtVUkhQd03ctZqu9uHvVbIRql8zi7kOiMG0NiXK17OHXbD/X681IluM2c8Nom36RV9CKoA99cbi
	O87LH/iIW+i5aBTLXaqIb/1llHbmRenRjpLx/T0nCgu/WYbKbxbRu/b2m18ZfmSlIqJM28Zy6qq
	kWU6bys8fTj0jACf1Xat/3XvZwbXmHf67OB5oqF+6NSn1oZ2r2ekG18AeyZKwnPNZZzIlwT9NFv
	iOwZKNks2xHeOtuxv8bISNzihE5GmVl6wjL8gk8jLdNQ==
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr14674477a91.20.1795551252444;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff67243sm5760156a91.3.2026.11.24.12.14.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55daa76673aso4175211cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551251; x=1796156051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=JLIABCZg6FmQE9p0McYwhgWDXIjy7OJU7Xqb+ILlp5Njq7ZOs4RA462hofAqLD6x0c
         nJ4Ur264TNVsOXG9GwYCo5/gdCc8DGbhEhB4bb/TrJofMJ68g3JlzMtkb9jKCzmRUFpM
         iFZZ4RUqTNJ968QWcSs2b+Tf2zs73LELR+p0k=
X-Forwarded-Encrypted: i=1; AL+hErF/L8gZWAyvSA2Nf1NXGZJWeeyivVKryLwKSLIAqazW5zVegVT2X6qGDZMk6+pEUnRaMyOo0GuP5xjmkk4=@vger.kernel.org
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294513301cf.49.1795551251303;
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294512731cf.49.1795551250673;
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 21:13:59 +0100
Message-ID: <20261124201402.3499613-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-6-rosenp@gmail.com>
References: <20261111042554.232998-6-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:52 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The protection settings (struct brcms_protection) have the same
> lifetime as struct brcms_c_info. Embed them directly instead of
> allocating them separately, removing one kzalloc()/kfree() pair and
> its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
>  .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
