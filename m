Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445957;
	b=z0UgJye6/KQMgLia8XsLHqc2gPg8h3X/UxX2g2/QFbiLWZqR2Nu1yHVINA/M7Nz6JrEC
	 7Q5scADTnqqhembPBHZMyUCs5ztpKpmVBM81bQU/ydjFl9jsU/WaoLzxcBEJVdxP3YTsA
	 Y+cuMmvjxdSaoEv3fhhiIECdRQAVwC8xCN6Hnt8OumsuPTYQG6wBPzuVzxCj/vX15v2D1
	 yafFRy+odDfOTyk4lXPxsmgyjeW+ey/lTYAXf1v051Dz0f1UERslNuBo2M8f2Drv36dPh
	 Nf/3UpEwIy1fgn14/hZaSln07pZwWsgDIGNP3eWof+oCpqqETf79Sxss/r0UlFQPZnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445957;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=5WG01q9x7fNydHzOUJiz8YwOwYvkUE1Kpri/g/6ilc8=;
	b=X7ZAaKSlaOvosw5Vys8buNpl4jGd6+2jD1llxz82BsC+jXzmycjYQd1xCgw2eiAzFPhD
	 dhOYuJ6/lgjHS7wj0aqlc8Yt/iJm7aoA+Wm6pQY8SQaYzB8cVeAP8zt90ZYdybl6L504/
	 ChkxikFM1q3i4TuIzh54ZREiezksSqXAxrpe6U1N3xrVeo+RDjUogi2UMvUKrokobN/01
	 9+8jgWbWZ5cMGs5gBVI1cezbKc+0+Qf8j/e9+AV7KDkpyHZY4XYnMuvbuZDqxWWDQiYR3
	 fSF0OM43zb4X4EuwmrRezo8JOnv9Fb8w0g60utKlv7TQj8pwOl9sdloOCAaq9Mut66A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hGTS1Ruz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d3+3+bM7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83978606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83978606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hGTS1Ruz;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d3+3+bM7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795445955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WG01q9x7fNydHzOUJiz8YwOwYvkUE1Kpri/g/6ilc8=;
	b=hGTS1RuzDrVRKrxSKbcJvTerLAvfJ0lf4JVxiYpPSytA//4WXF7uUxAcq25iujSIYKdS26
	yQ/o1oFBaZVzAu3gEVDppXV01qIZbBmpW1hN0uJgQEaAfk8KQRO5L62GfpGBDqWkJBrWHq
	mvUZ82cl8P/+z3lqyKtOB2izve1ulwk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-hIjIp-lCP_qCi4UEACJ5Zw-1; Mon, 23 Nov 2026 14:59:12 +0000
X-MC-Unique: hIjIp-lCP_qCi4UEACJ5Zw-1
X-Mimecast-MFC-AGG-ID: hIjIp-lCP_qCi4UEACJ5Zw_1795445951
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so2579775b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445951; cv=none;
        d=google.com; s=arc-20260327;
        b=YqsfbxTmHQEk7xQNgNQcR0QmrUiVJ4KoMUjY/3fkBjwI+v8xqlWhdIkK6k2Dy02ZvU
         INcZyE2ZzahbyQ+BrzW7VRTth/iXc/AR5xxEgF1oz8Su4hTUVVhJ75vEAUO1dUKeAv9B
         RiW8YLHRwHC8B18gCaRL9UN1T+z65PADvZsKzJqexqdkiiIri35apo9Epj0t8o813tF+
         CGBK2ZwWLEOV21k/eEEBxeJf4ySIn3xeJO4Gp8sq+PgJTwMK0UR7iUS7jlN5R94lePUZ
         7yC1YPBYFXrSQCdtZoIBWi/p7PUBGLYA0rPBvsvWbku0hptnDWtZUGaiIc0OBwo7v0RJ
         +0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5WG01q9x7fNydHzOUJiz8YwOwYvkUE1Kpri/g/6ilc8=;
        fh=mrGSCofAz5RIfsVXEPBHZEad/v7HuDIFw4l7tm47oKI=;
        b=FbHmvcM6q0HotTTrmFKJgbt3JivxbhLLE0MEzlrpSlJmH3/IT4zQtl2rHIxwAIT+Wq
         N1uPmSIji23Hat4Rf5uq+WmC0cmYgEtv/sRuvRdmxjhWuX2Aa1jBVYLWAgpYU8ptNZgg
         4b0LpOkeaGXHYut4fv1TByTiSHn+t/+zl9WKc8BUjxJoSp1v9l1UuB4lLtsK8leXiFdS
         Lfc8X0w/zUo45BHCr2GdL6dPRDvZ6UM0iGLT9rBKDB/sPmybw4b24S/nTp6tJooitKsT
         KNBiSmuRGW5HAkUSbsboFudChlkBpOXnlQCKWxW47w2SivTKH39ntxjifetvI7syXKoP
         k57w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795445951; x=1796050751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5WG01q9x7fNydHzOUJiz8YwOwYvkUE1Kpri/g/6ilc8=;
        b=d3+3+bM7he5Y2G+2euqbKTlxaMtghIWg5re0Ovvm3BCX061B5/OY16yV06g0POVd+S
         CkbQE8LLLs9PIEaJHRFHgxscVFczG3vq1EFYRJTm9/QLGKk2IV3Tg5ufmT62Lgx9YkFm
         EsPhhjPDJOrEJ9pW534WXhdVrIa+HpofQqmIPBevOuez4yUpCivdruXVKMfurXS7JaCk
         PnTBdstjl2SqWdTkXiRuyrvStOgFykB+BIZV7cv0kBk8x34UaLzxy5dwC4p309TRgfy8
         M3CG8ozev7wS2keHNDJPL1jIlh24kI7YMdoX00pc8zWPpbNGNsRUaEeQSMqbNPHtVujC
         fjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445951; x=1796050751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WG01q9x7fNydHzOUJiz8YwOwYvkUE1Kpri/g/6ilc8=;
        b=G8FkgLKMpP4qsSE9bOq4Q9dYa7zQfArKyzcpU1dEBWmrL7UWn9NM0/ZygSrHPxFnV7
         mpeSsC85/tvBim+LpcmonetOLET9D1C2McXX1sTvPTQWcUNrt9wP9a6LUnbn6k8/Rrbk
         j27Q01kisHpDnpIUVGibN2plRKdOYZLcWJEsO4C8TqbDbywjlsQp3UR8YW29lyoiZYnK
         bB+WcgAfhD3Nqk9U6Y6S6NU2gW5PBBK22hbx+64EX13Mcp8ePe26d/XY9GufXRr/WzKq
         cHGGf4KQbazJJQ+Aq8VMT0XdJnRELTw6+C1lYb1juZNDsheMzSZF8TO0b8TFdTtIV+pw
         WrXg==
X-Forwarded-Encrypted: i=1; AL+hErE5HgLf/3ZK/SFos9qFIwmY/OaOi7ivLwCWYgkGOu/roLYy/6PS5G4IHNtcpnrK+Mw63wZq9J5hpL280wM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eJnedWFmtmsh2QnOUkXhzZvDrQGuJfeNFqkMChrq799M8NQOn
	0H16zVzljpJTy0fv1dp18C+ZExNbjGcGJQ+AHkYVi1TL7733d6+Ga8v3lMeIs+Hk9nzt0WXjudO
	SMJsNMn8qR6A7dydA967KvL1vuBj+nfmsV+h33bc9ajI9kET84amHE85r6sW3GsSrWQ9WMJD+Dd
	n3h6veR+j3YRD5qNFALHza38xPw0jZXc7gQWO65W1k
X-Gm-Gg: AZFdTZf7i2cMKZNOlXc6QFScZy/IfJpPhOikWKHE3lzPTDwjb3XsedzHigPaSU8Pt79
	LSoxUayYoIBgEW8UKwAkEOsaqcbYpeKL/Tjl38x8DqNGbGm5I14Z3EcWmEuIa37C20n/SAYwP2c
	+Jyry4aMEcqnld4TJHL2XGZA0qf5whXPAcIrz8HQPqyNlaaRfUAXF1WhIcPeSGmHtqBUmUAXEUK
	KD+cPltjYEp3hs=
X-Received: by 2002:a05:6a00:4b03:b0:89e:3ff1:920d with SMTP id d2e1a72fcca58-8c87d01fba2mr9824122b3a.45.1795445951325;
        Mon, 23 Nov 2026 06:59:11 -0800 (PST)
X-Received: by 2002:a05:6a00:4b03:b0:89e:3ff1:920d with SMTP id
 d2e1a72fcca58-8c87d01fba2mr9824105b3a.45.1795445950862; Mon, 23 Nov 2026
 06:59:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179360289114.124676.5863600854966859222@163.com>
In-Reply-To: <179360289114.124676.5863600854966859222@163.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 23 Nov 2026 15:58:57 +0100
X-Gm-Features: Aa3M54p2FJodcylC0BM21pe9oXJlWt7vaXOK68xEMFI6ra6ca-U3i9Z5NfTFnEA
Message-ID: <CAP4=nvS-iHK1aFiwvdLtSf4sCYcfFvqj6cKjkSb0eJs-O=qfmw@mail.gmail.com>
Subject: Re: [PATCH] rtla: reject -e, --filter and --trigger without --trace
To: Chaosheng Qu <quchaosheng000406@163.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:03=E2=80=AFAM Chaosheng Qu <quchaosheng000406@163.=
com> wrote:
>
> From: Chaosheng Qu <quchaosheng000406@163.com>
> Subject: [PATCH] rtla: reject -e, --filter and --trigger without --trace
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Tomas Glozar <tglozar@redhat.com>,
>     linux-trace-kernel@vger.kernel.org,
>     linux-kernel@vger.kernel.org
>
> -e, --filter and --trigger configure events of the trace instance that
> --trace creates, and trace_events_enable() is only called from inside the
> block that --trace or --on-end trace enters.  Without either of them the
> options are parsed, stored in params->events and then never looked at
> again: rtla runs to completion and exits 0, so the user is left believing
> the events were enabled.
>

This behavior is already documented, see
Documentation/tools/rtla/common_options.txt:

    **-e**, **--event** *sys:event*

            Enable an event in the trace (**-t**) session. The argument can
            be a specific event, e.g., **-e** *sched:sched_switch*, or
all events
            of a system group, e.g., **-e** *sched*. Multiple **-e**
are allowed.
            It is only active when **-t** or **-a** are set.

            This option cannot be unset.

Currently, the trace is the only consumer of the events, so nothing
really breaks when the user requests the events without -t/--trace or
equivalent.

>   # rtla osnoise top -e sched:sched_switch -d 1s
>   ... runs for a second, exit 0, no trace file, event never enabled
>
>   # rtla osnoise top -e nosuchsys:nosuchevent -d 1s
>   ... exit 0, the typo goes unnoticed
>
> Reject the combination instead.  This does not change what happens when
> --trace is given: an invalid event still fails with "Error enabling
> event", and a valid one still works.
>
> Signed-off-by: Chaosheng Qu <quchaosheng000406@163.com>
> ---

Any reason for not just keeping the current behavior? It has been
there ever since rtla implemented events. Changing it will break
existing uses that might always pass -e but only pass -t when needed.
I get that the behavior might be a bit counter-intuitive, but that
should be covered by the manpage.

(If anyone else has a different opinion, feel free to chime in.)

> [cut]

Tomas

