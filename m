Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936954;
	b=SB+RfXxtN5CWLrAoT/fOzfCyCpduKPk41toXjVbap3QU314VvfLUaCKDjfI7uusB+n5j
	 FK2OB+r4Kx/y+KAxLAv79TReiuUsZTltNVMq1JLCJJRkp+bBUEqPvEPt+rilz4q5GZj3B
	 tDIaiTteYYU5Mt95NPGOxsarUYYsxl9i9bEfryT1vi2sWxoIn2+2vZenpokpvPTH2jLKg
	 1c4Onc/td5cuOIT6AX/KVAJoUAQrhViBMeRW5+CWB9d85HrDgLzphKgvz+i7Dh6R2cD1t
	 YCfz8Od0/yU+5tm48Sqm6QWNp8zkXGoNiCiJk4gW8sIAfVgmlL78A1XpyEiCKceTdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Op8k0rbkFHjlj5Xpq160zqvss+WGLpfkmyU9f5oGVbI=;
	b=1gUJduyjpa4ORyPRcArxqDprhgdAVjHgpPngqVOrDSVLJPZkaW6KDPNmHD5TGR6y8NnU
	 S13NBTlEowbOj9hWucrbfW5mWc0m8vgDeNbcTq04BiFePhi2mw+jcDno4EjILZcphe4cx
	 /sVcrGdG4jDlkyLfGgBoZ/FM452TjZmCtptnDbPnhGnsP0LOmBeiHuHhSSsGgd8NlPRgM
	 pnVA9zZc88dVe3i8JewhyMw5+1U2bBR8xyUj09RBnyMt9C2XEUI5Vqcy4UQrByzkPy+al
	 2Ps/xD09BM3Ky7EscQZ7MHaeESHz1/yHKEdoPP36V+mfywxAJZAaq9cJNxe07nb2I1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KW2PcXFe;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E23606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E23606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KW2PcXFe
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso865653266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794936952; x=1795541752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Op8k0rbkFHjlj5Xpq160zqvss+WGLpfkmyU9f5oGVbI=;
        b=KW2PcXFeCjuxMsZtD0FkUR/nt92huuyMTWju3iKTw5Nimm2U8e4IMb5OdyW3texQQz
         fkqeDZGNclwtWfzAbBLUiT615BZ2RTvv/8B7stcVi1GPkeQakvfWrCabtxyWZ6FJHTb2
         4uzROt6Fu/BQOi5wddMP+fkMw0uqJTQWzIyns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936952; x=1795541752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op8k0rbkFHjlj5Xpq160zqvss+WGLpfkmyU9f5oGVbI=;
        b=gHshF7J0D0oGd1jG3FH9cOJa96aR9RUfo3ENE/JO8VI83lMPfx0DcDYhyhPGF6QMXD
         NTIZlt6inX7X848N/EvYx3sLSfm/uG0wAsJkxzXT7bDA8uw3VxsmH8M410LUzvoWMKQW
         YH8VuTorDwrln+K7Pw1ieuOtuQoB56uCKOrDMmhuWwPWVdJGtW42jR5RtMjKSZ2FdNWF
         yE455z7b21Mfj3HqEcWqMRH1SXcA/0dNFKVizAAcfncNwSRRDuUYysdLLbrymkfXYtJR
         3EmkZpiNTBUEOmO8Dt7EBISFTLXgsVujFIEGJnZQMo7Aynt5ZBDpj8RxGvx1aO/ufzx4
         ctGg==
X-Forwarded-Encrypted: i=1; AL+hErHhIUIJ3GYhRZUfMjACO+IBv3MSazD8Ae6zfC4vUQKoIDznoSbIeRWmKL6gFp6YY9qPGhj+AZu5h9R2GLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IsWD2F0aTnvxdrtE+vNaPW6Arnx6Qcr+VbWe10vN8JZf/i4PH
	OW7kbxtU/b7RdOEDnoOPsLPuElRUV8xGah0G7DOvQa6Q4rYg7g9HVb+TnPksneXDVfo3seWISLm
	5EGsjAg1EiA==
X-Gm-Gg: AYBFou3uc1Cs92eca1806rep1wImkxceXGRa7nBWGKa5JhKj/DVA/6vnhKxCyTQAXIL
	RtvW2MA4DuxBFeIbwRlL0fW9pVJj/77AqOff+tL4FgcddwXrVm527mzEatEyLpyJuePbTSg0vN8
	hRyj/MNSfclrQ2pp6cx0tfHUmz0CZM3K7hw+eJeVU2JSBG7yIcVqiwC5Gok8vKsrb8eElDsLcBq
	ZF/3O/eBswjuGcud9tTW9rSIB35dexSB4zfLA6rce+VwuDxJ30xfIc3P00/d76ygL+k3EWs6NO7
	LTePDU6A0lBGLbmMHNJBVvkVqGvsqLnl7q0hsABmLdFERSWmNkci1IEVEJTZ05BQj5k1UtGPuN+
	BBxiPEk0At6VFtywBpYB6upCs7NpZHkvKPFlCcUOq4XWtIcGqm9BeBNVqXlWOPXfVHxT/VAP9/K
	7JiaokmCfMz5vRN/tLCLiNQuRHLPoF50Slu0I9YXCYk0U9FMuZPTjEtZCNe85dpuxbfYZi/OV6+
	e/mMLjst0mMOjlE4g19tUR+jUqQKLHUrl+makFsvhYl5zw5xDP4j5Zm5uVIeGy9y8yI1Mneig10
	NNg0i29h64gyLV9NplNRIL6KLnzV56WBJ+TTzuwClcy7BhYrpIICc0sEdtgsJveGL9FE29JQLLh
	TUYMX3/e5NAXaCZV7qEVu90a6
X-Received: by 2002:a17:907:802:b0:c46:b9b0:8e8f with SMTP id a640c23a62f3a-c5096440320mr1263053966b.41.1794936952260;
        Tue, 17 Nov 2026 09:35:52 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb33a73sm6343066b.74.2026.11.17.09.35.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:35:51 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so873491466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHdKbUy9PhqTUmATfpjhnoUwH3Hj81J8d7Ya7G8vZfKPwDq1caZOcBFoeASjdHL+AoXCRLJC7VtBqCTPo8=@vger.kernel.org
X-Received: by 2002:a17:906:5642:b0:c50:d92b:6f40 with SMTP id
 a640c23a62f3a-c50d92b78d9mr526182466b.20.1794936951190; Tue, 17 Nov 2026
 09:35:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com> <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com>
In-Reply-To: <avyODoFhZ_M7YDU5@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Nov 2026 09:35:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
X-Gm-Features: AclHuK_5gKon9D6gpxIEpwE3Nt5zs6NVA-jEDB-muz-aO1jPRcXkbqK0yG36EEs
Message-ID: <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 at 09:25, Oleg Nesterov <oleg@redhat.com> wrote:
>
> So. Do you agree that we can "ignore" this report from Mani for now?

I think we can ignore it, but I also have a cunning plan.

Normally, exclusive wait events always go at the tail of the wait
queue. We do that mainly because we want to wake all non-exclusive
ones first, and because it's fair.

But pipes don't *have* non-exclusive waiters (ignoring the splice
case, which waits for space, and if there are readers or writes that
would take the space we don't care).

So what we could do is to just make the pipe code open-code its own
wait event logic, and add its waiters at the head.

Voil=C3=A0 - we never even care about epoll braindamage.

Yes, that makes pipes unfair in that new readers get preference over
old readers, and maybe that's not great. It might affect things like
the make jobserver. I'd expect it would probably improve throughput -
new waiters are hot waiters - but it's most definitely worth
mentioning.

It won't fix the "EPOLL edge triggered braindamage", where old
applications asked for edge triggered things and actually wanted level
triggers. But it should solve *this* issue.

Hmm?

Let me stew on this a bit.

           Linus
