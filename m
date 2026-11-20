Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174506;
	b=K1pqa/sAhClsVARgo0c/gtWIV+ROBQGUTQoCiqBsmUQhnvOx/i5huSBrfI1HMiUS4aRn
	 zM4Z+lHcsxE2J0FobcDtYYRPdRi0GudmBf67yQtxC9jbbbEPGWNeUdZ9uolHvT7SoC6VD
	 L1dVXrXxtUGueHJxJyZl20xwONNpV0fFbxRjngGPfJnzLGX/li9aY3t2ar5NzoANyg4rV
	 vWCLRl7qs2Uf6YWmBVNsp+9wujRZ4PvN2MmWHwBQ3oqt8t7QWXqMCDGePzTRJRy6uRitv
	 jKTfCXLXAoJDbEZR2Kj2IRx7YOuLArrIuEte80XnxkLsKgCdN9cmZw0pj6YuuH4f1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bkrqVl4fOtFiXo/UNE5/tK7V61bZnqlZiu3NzPQivMI=;
	b=AZJZVBiunmrwEDDqUfV46lAlrSizMG9t6PC9FH+1f2JBWl63MLqbwDnV5y6635QWMtub
	 kqhoo1p3XleCr0opVz6btWwjQF/TCXaPysQoHF9DrZ4svUuAeyLKLO6Yuux+LPfFO6JoX
	 EtpPmWqtPDxn7p+ZCg592dWW/LYS4PcdfHX3Ok9I2bcvtHeQKZlNAGx7FNzqpQpE+qS8J
	 j0Lp8tpHLYEqibHj2cKQavxotx9F+R5ZsRtI1WRbyWe6iC6haI9VtmbjUcHSNKzZoh8cK
	 kg3AKIDymW4v419tTK/f8rDLl9rtmhMLzZyAqbMhE3gXDT2sJuPWrKo8RIEUAPyXCkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W6WXLOxR;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C635606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C635606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W6WXLOxR
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c505eecba6cso88768566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795174505; x=1795779305; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkrqVl4fOtFiXo/UNE5/tK7V61bZnqlZiu3NzPQivMI=;
        b=W6WXLOxR59uIfbaLpHw1RDG/aYC7BEPo6GMxxJsEX9hnvcfGjS1k3ZxVFqUv0AFkjU
         0HKbTZarlk3QbD7la/aeB8WWyj+L/d5uqI0/Kldt/z/TyOE1+EH/09J3/nHTMQyK0IBx
         jSis/yb2mQuZrhseR1h8momD+rFSWBeTNFj84rX/cxm2Dnpnmfrw8z/DCwxAxLfXy2Ur
         mKJvD3oJuijaym9T8sS6/FoceuszJAg3EDkJLxqhHXEGmp09BkqY60UVtQ1/yZMV4Kcy
         hZHrQmG+9lVrEffHnUR4gsfHbCOME9UhqkRa+c6QImLe+mLEXqYh+04zjVrAMvWLEN3A
         JZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174505; x=1795779305;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkrqVl4fOtFiXo/UNE5/tK7V61bZnqlZiu3NzPQivMI=;
        b=puChJidCAmlAliR0kAEIxLwFlllPSh8B28K955988G6rh9el3gS6MToue0zOojjc0z
         RmtzTkwWYUlzQB4W4Xl1azq1/Sw9UCyTfqTMJiYmQYsJuR67Dqr4A9CN42bzlKzjyS/L
         hm9mq50fqCma49xNN1ITFnYIEmN5MD8PWDxKnPIcSiIKBtRm3PRshLryeq2FUJ4LtB80
         F1TjnbTGWOaWQY4U2/57bSYCWLAlq2SnyR27WNloG6daDZ4k918x1/Viu4z8441CcvAr
         FYGLQsbRQ+aPEt1O2NjxkeobEhCYzMXENJINkpSNFYzQwJCcuabw8+3Vv2OMWAbswjNc
         v74g==
X-Forwarded-Encrypted: i=1; AL+hErGkxrnI2iRjcufzV6irF2y3ZYP06MGYQWFY2EIiaLDPkueK1x5xnSEbCRHQD+xwv3ma/zPfC7JnOsVXoUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e7egtFFpxqSfyQiBzFJ1FFdOpBKdJqiSkkI5l7dP+AAqu4pKx
	/D6t4qMsHsGvFoiAY+4rvDs9wNAlUFTxoqXvt1IfR6kBLPiJNarYRzNYZ9/LsNflATHbpRQqOA=
	=
X-Received: from ejcmy22.prod.google.com ([2002:a17:906:5a56:b0:c50:5767:f11e])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3e28:b0:c41:7e99:c6c2
 with SMTP id a640c23a62f3a-c513ac99405mr295016666b.44.1795174504655; Fri, 20
 Nov 2026 03:35:04 -0800 (PST)
Date: Fri, 20 Nov 2026 11:35:04 +0000
In-Reply-To: <sashiko-outbox-223014@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
 <sashiko-outbox-223014@kernel.org>
Message-ID: <awAwaJugal622uZf@google.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: sashiko-reviews@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	Serge Hallyn <sergeh@kernel.org>, Andy Lutomirski <luto@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	"=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	containers@lists.linux.dev, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 19, 2026 at 11:11:50AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does bounding implicit owner capabilities by userns_has_cap(ns, cap) break
> cap_ptrace_access_check() and cap_ptrace_traceme() for a parent namespace
> owner when CAP_SYS_PTRACE is excluded from the child namespace's cap_bset?

This is working as intended. Implicit parent-owner capabilities in
cap_capable_helper() are uniformly bounded by the owned namespace's
cap_bset.

Concretely, this only prevents an unprivileged parent task from
getting implicit CAP_SYS_PTRACE via ownership of a child userns
where CAP_SYS_PTRACE was explicitly stripped. Holding explicit
CAP_SYS_PTRACE in an ancestor userns (or owning an ancestor userns
that still includes CAP_SYS_PTRACE) still allows tracing.

This is also unlikely to come up in practice, since typical denylist
configurations would only strip high-risk capabilities like
CAP_NET_ADMIN and CAP_NET_RAW.

If we wanted to make an exception for ptrace() to still allow
same-UID owner tracing when CAP_SYS_PTRACE is stripped,
cap_ptrace_access_check() and cap_ptrace_traceme() already allow
same-userns tracing without CAP_SYS_PTRACE when the target's
capabilities (and userns ceiling) are a subset of the tracer's.
Extending that check across owned namespaces (similar to
cred_cap_issubset()) would be straightforward, though I'd prefer
to keep the stricter, uniform behavior in v2 unless there are
objections.
