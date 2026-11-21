Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795256726;
	b=D01PQeE/my9sGY+Bhlx9X9qmq+W65H01zn4OxvuKPpwETcYXfdKD5kbH4a20GxDv5X0d
	 eQcU8zJaB5xl8lwlg+Mj3dBF6sttBqmM5sAvsWqgXiyXN0TOc8guFAQkMInUTPo2/C/oC
	 rJqb/FTPpLGQ5oYJdYpcwC7Y/GabjmwR+wf+oNoaCilYbPU21DVC3rNbRRx+ocMs4WsV1
	 nd8d8kk+kh6nWQcqk4RZ3Cef8smT6z8cUlbzBt/5ee/6zFQ/qXktJ1pz79RmQaIDJIIUz
	 iwvlDpTAHdzDGhR+bp7BNmR7qsFmaL/acEPVtM/1xA9M1arE8WZcg4EicpNMcUSayPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256726;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Oc8iipyzyYfaL6h0ci9uEtthlQNUz4zL4K4Mf4Joz8=;
	b=08XZPkU7ug2+ejTvGo+PWWRITxxrwCXHiva0t+Bs2DvTs9EvWOwmzc4j8kIB++1v2Qvc
	 SSlGnPUCp5aY3mVm5Wf19uc+V6vv8jkKYxB15RkFj2rdQHJQy2428a1DStVjr5MoVQsY2
	 xG1pBV/HrBRELxPzU1bF14rfp7zJi3jvvkyEKe9TfDOleY/mydyxQkEe+JjxiQqIxywvH
	 82Oeg51mWvAqdcWrEXjhuJwWrAJMeN50OpC9A/dCiTuQ8Ur70sf/eJGWEcyhui98pDSwc
	 5bDe3+KnqS7tlK95PfxEIFCkuKDR7pDe7Nz/y3BjFxLiwpq2U9/iDtP5U0nY4CBdjJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UqhQiF7M;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="m3g5DP2/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD86606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD86606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UqhQiF7M;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m3g5DP2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795256724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oc8iipyzyYfaL6h0ci9uEtthlQNUz4zL4K4Mf4Joz8=;
	b=UqhQiF7M2RRuMEoYYT9g5avk/nPLd3cj5QX1uGHKhqeCf99Jf7nFJmFFvKzDEKacVAt8Ie
	35AiqO3TGB1eArV7JhTSfbxh0qVa8CSNmSK+5SzD7Z/eEzAVwIYgCGQX3h+sSCj25e7Gfu
	uYmOUOYlEDVVLLZqcTZyGpayzPGtzAU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-aqZI6852Pr-3al6HeVVaEQ-1; Sat, 21 Nov 2026 10:25:22 +0000
X-MC-Unique: aqZI6852Pr-3al6HeVVaEQ-1
X-Mimecast-MFC-AGG-ID: aqZI6852Pr-3al6HeVVaEQ_1795256721
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so1215339a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795256721; cv=none;
        d=google.com; s=arc-20260327;
        b=WqEyjwdNsbLsGTGCIRHGjO4OsL6y8N+T779220NhEXNoJqSyrNuJctG73XxxqHXUmn
         aB9w/5KZwXSZE/U/cCoR8Yca5gmY1Gitt4DpsxAw/5pQdGs/VwF3Doiiud/9ICZkF2Lj
         +XG+cn3Wep6TYbKmI7yg/bZUrbAax0WgwiUqTt6s8bTwO5NeS1Mduo2gx7cJZVI5/oWr
         u0iclbcfV6RWKBkE64PfnsZxpqyeUqJI2Lq6M2uu2laxMsJJrTPumdXIb4KYM3KyvFt4
         Xr8pvAHQyd+HRZKkUo100c3GX8KailICvX9vAbmA2DJgRLu4t2PDaPgngBkAx51gvDG6
         +R2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Oc8iipyzyYfaL6h0ci9uEtthlQNUz4zL4K4Mf4Joz8=;
        fh=1DVzGo9Ad2m+wjmj5RALVC068KZEiAuLi/D+fvU5GaE=;
        b=b+U8MdSRAGM6SUKXzTbj58/dIh09keOBzD5mTBNenE3pksPNhIe6wpnRAV0Jti9eRm
         3KLmxUs4UG9uRMwwhQBxlTqK3YVx+c/UUl1ki//+pQKYBBBu6Wm9PwKfz3S07w/Xf3Ry
         JdDSkW8y0HWVtHDCPjXleg5Ixekamj1pOvYV0mIGGeFCgpdijYnoxhMhrjSUg0aoAaIZ
         fha0rbg/A4mmFIKW9SOkSceWh7X8SJEj01lIxTSrpKJ3vtJBj2ZhXTgO8TijuRbQ0TF/
         /4FqvrWq/c+GPvIn7qlJX1ihTX9kAXbl5g2IHVk/rX/QhsdyPfKaD1TRbQlFT946OnSJ
         DbYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795256721; x=1795861521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Oc8iipyzyYfaL6h0ci9uEtthlQNUz4zL4K4Mf4Joz8=;
        b=m3g5DP2/bgL+FdKaPzoLCciu2BjJrPAHR61qwzlIGsaNsGbXrG8hAMYdwMWL/NrhIo
         4kSmxwM3/TtxmIx14793IXFc9sUWka8mEndYJnZY0mIikDMAqMpVDQHgDyRCxUfS7vb+
         lrP15dtGoHe3h7px2n99k9DzZQBuYEghmT/YtEFsS3H2gw4mrSJDuLg7hN4SuuMbypWr
         YSfWSgo/w6TNSVeF+HFiixCdxX88cP5bjDqL77WKpt35WrBj/jtUgTCfHZatTLo/fylM
         9PNoGZY2RhZ18BXLrl9yjZW605WxblBSRlYbhiYFRXFUfRAgMwFzrX+N6BOGEvE/Kcy3
         8bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256721; x=1795861521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Oc8iipyzyYfaL6h0ci9uEtthlQNUz4zL4K4Mf4Joz8=;
        b=AHEBnZ3/JVuz3HQeA9DsDOv+b14Ci6G054EiAY1jR4qH3dsy9NJK0sit6PuY2Q4kSH
         jXLTWi4teWmdOlcgGFgpE49U5POoxgxKE7iDm4Qyrkq+LH9iKNdUc/ZK3ZuK9V4BM/US
         7n7zrD4x5gcKcWFjBA2YB7MS6GOGHGxRN+e1BK4NUTD5dfr2oY7sxmvXO30TR5xczc5O
         JR/TrVk3TXp/KAeOpga+NPtfVwCJcBcs4U2q8juu6oJA7Ut3RLIsbg/dmsTZfaATbOEb
         W3YD6DVasVT4aaSienXdOXoW42yy5eiFiWmdqzQnb9/FEKsAxL+wVt/n6l+OM1MpEmMG
         n2Kw==
X-Forwarded-Encrypted: i=1; AL+hErEG0aWlsUDTizZyt7ZysNag/idHeZjLlSww0ZdyD3GuJwYFiGB5QzhsK7LjpJ3dcyCVpHRo2/nih021OF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z891L5FRdCBZimajUWaoNI7WrCQb6TYDe7tuCx+x8qpYwav48p4
	ZW6LgK7IYuYEPhU7Uy+1BxtowBuFhD5w0qbfpwDegXBUfBvt6gCAptkrwubPi9DBII9HTObDX58
	btjb9zgZmaobZJ9FVRThRPdWo6hBanxYNJxNdyhiGxxjS8/e+CRic3RS5MOsCs2XZKF5RkfPreH
	SMGw1QWWi5TSIbwJEhrF5IeOFJH2ICrQDfN+SwJX90
X-Gm-Gg: AZFdTZfdaJFJThxxyKP87cQa+jBQ9zmmBj6Qkcybai9wvMDEgS9J0DS7ollyG7DtZ5T
	RyofXgslrhWC+NE5fDhxLBC7FzTiNEnc1F5CuqcKmhMZio27t/zNWblhs1bBGCBbGl5TiVFDaR7
	JdXqMyMnHr4F9OiUXmtOvuv4UMU0VwdbzROJkSNOHyFSCTsmoDsCPDP/rTI0TJ6snDUz7mhbDEu
	bh2CFU3CIkeT0ozNmiXDe2rI8QUzX8WhpBK/J3D9OgwKme+VNWoty0SgH3nn/cJgZr27tNNTDu0
	YlLvLXwLgOejmJ9Ckh2V
X-Received: by 2002:a17:90b:554e:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3b41c981a67mr3806654a91.41.1795256721037;
        Sat, 21 Nov 2026 02:25:21 -0800 (PST)
X-Received: by 2002:a17:90b:554e:b0:3ac:860e:1af9 with SMTP id
 98e67ed59e1d1-3b41c981a67mr3806645a91.41.1795256720577; Sat, 21 Nov 2026
 02:25:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119201813.15320-1-seanjc@google.com> <CABgObfY_iw6-Yp+hJB3pbV4spTMJfLc2M0jMs8_tu9xumM2wHQ@mail.gmail.com>
In-Reply-To: <CABgObfY_iw6-Yp+hJB3pbV4spTMJfLc2M0jMs8_tu9xumM2wHQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 21 Nov 2026 11:25:09 +0100
X-Gm-Features: Aa3M54rshjkaEHMpm4QU8cPI31BaZQceJxcxyffUa5GXdcMvaY5QBELRR1-AHuo
Message-ID: <CABgObfax4jM8M+SSd5YXKfcCMxtD-9hBye0R9jx32zWpyux=BA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: Fixes for 7.4-rcN
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:26=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >       KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()

This is missing an implementation for book3s-pr and booke. I sent one
at https://lore.kernel.org/kvm/20261120133623.479601-1-pbonzini@redhat.com/=
T/#u.

Paolo

