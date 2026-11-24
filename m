Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540800;
	b=fGp1QLLhU0OEwVdFYiXZ6ob9S9/F9a1QTx5tiQxvNoV6FNc7iZ1r8Km+vjEyAOiJTZPk
	 znF3/a8lqu1fMdIsEdLBJoLHNpcyFhJqEc7IhMpJzDCql/LlrjvrI2QAyYPPUFNv2wZYn
	 zdxfOmQdz8xEL0xujj6zBlUjqXs8VdcJvtUKtBWul7ZyCV3Zg3IpZhGxFOYdypX0+fNw5
	 0x56xpQsclnkHC5Y9yu/NmoD3JKZsxDS6yObF5ez0gBrzhvUHWPLxP+RSXB/GiTQtL3Sh
	 O32Rm9tK3i7UuG+iB2FAiBEueGrOkHSH+On1MschXBuyPd9wUVrFJNrNO5hTccn7NiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
	b=FsWgH+1kEvGhkuX5OcY1x0vszj5j1nT7G+nwXe8Z2t7Rbg82E/jjoVOCiDVUMKu2rMcY
	 0RbP3cNejK45gW1EB5MyHGSz2QPfESp+TwYHWyufQZcQhkKyeF10LRRIAuANZgemKRwo7
	 Ef7xgo0GObm5vAOnoddgSikXqky1T889Gwj3oWCMWzDeeY24IQnqg8/mbP09hzrQ420mi
	 4RMV8lqHbBDIbeXwshj5UBOiuAObRQ9dSlKaqdAwJRo8yz2vt/O02c4aILOFCohguYPCZ
	 ZWhQ584vJVw3C5Tq+FjkSGKIQGSepik19naDiIhS/zzjHyZ87FiMwcQNY7wNePa2z6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEdMmKAK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEdMmKAK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so41129605e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540799; cv=none;
        d=google.com; s=arc-20260327;
        b=YqM3o8ZIr3TDmD7cvN9ELy6FxkTDGc3iTDKs9sMBcij3wQRY/ivOlH9hq3i85RUD8D
         sEq4ntRKdeOgPgU3uOuqlWuHr735uLr5iEO3xJ+vEummo/bMcnywJEZlYBNZ1A1xd/qQ
         h43CMgdWPJSETgEjjWTNWTOpgk/mvcoM7H95l3Rv2Woa8pVtytlqsyi1yYCO5nCGs4LY
         XJtL/wfYWQXBoOhGnGbw3/ohLon7tw2c2ZcJMcqdMZ1lvDWOf/9nPUIy+1dHXn4Gumgc
         IFULSJYx+o40tXynB0GJI9MPng7dkDqE07adwGGYQfD9tEBKweuPfgEKSVag8siiEQkJ
         AWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        fh=/X4n/NS677dWBCQVmI5wMSze53DKxlXbZHHNEq4LBwo=;
        b=DsEEzx1gCZPTdyBHBWdqRV0lz9uLTmGm6EXbFOPRxOvvgqCzUDw0/H4/tJvKZUBhWd
         qRmQrJdiQdeWWJFKQEzYRPXC9FM256kFekuDS7NR3UohNvXbxWujmq1VqGdykR+Cd0NH
         mZFHsrjsTiEKVjtDLvms1LE1BviihoF/ThrIzUIsrSLE1JZLZi1JveWQb+7KKbrXT8Nr
         0VJudduMnyDilVXwccEC+TcBBBLQQwSogIGuxdT2tSbnZfvGyKBNgTO2Sm17JWWvUbED
         zHBeLmuMOyXb/4/sLJpM+DD6KWs5Jrr+usPKwCzqGiPc+ds13VIBgbHSJFcp8RRKIle4
         tQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540799; x=1796145599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        b=sEdMmKAKvHAF6+bOEUrtKd9w07tUhTwyCvIlU34VldlORSo5/94WD4gjL3zIgravLX
         i1VWQCmyD/L5b0ICrRoSFWPGmePK6nm38QkNpgKSfWLCunId7wp3XMz/eg8Skqivz31O
         LvcjGiCbIGKLDETBg3RWXHAVzEUE4aRRIZYuet0jE2T7DBNy1SrtreXLoX7ZJOKPI1yV
         GfHI6F2FbzyOUBrk+LyZGyKoZ4Sk65y+9FAaXOrInNvB9h72Fe26mweN2lVZ04w6Jyif
         VYdW1udaWJjDXehNqpTiR8sTi92H5eRe+btzKG7KxYNzAUZRoxVPUjWGPdA9ltPsxrSl
         nXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540799; x=1796145599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Sa4W9FQ13TndG6KfCVgrINI2FSIc+okogULQsXiVgQ=;
        b=ecEQQ1BjbFEpYaesLKMkBNPPENzCymACtaJqmDs5WaqGWruaAVyb0vE3j2oojSX38K
         ki3nG61ngKx5WyFJcUl2Gsad2yp+F0uE9fwqvRP9kZSpMOO04KhdhU+CIHVx8MQwD1V6
         Snlj/pN6N3hso8eN1V+bvlKWJkh9mhMMJma1YGIhHwt6Oj/rZHoOjoumgRCs6mD/HNn5
         zz7x6wv+2p47uWcZBXsHVMIqcrQqyqheK0zwlKSZosZWveeBFtUY5JGXoKVkAC+v4bYF
         Ic60NLYDLCFJ70FiKEVss9TGk8bdlUWKei9Ka671bNEEMNyRCcMy5ldZyfPOciSimtWC
         2EZg==
X-Forwarded-Encrypted: i=1; AL+hErGEcSj72SKBPvwlp0uDdj8kpI0f24Q7Whl4CQGhrkaFVWjM14eCtX6CDqkgcnWiemALWRKKxJP4nPCgV8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+wVsmO4LwvMP9D+caS/+LI/oTn6LHtWBy7v2MVU/+2VR/cudT
	UHUITX83sePOxpCLk7Axx6+6Lk4oUaribo2jpQi1OlHYXkvIFecQUw+3ezCEAOznmpRlDIJUgER
	uaizTzz2+d3P5DKs+0BLrD8kTBlS91wk=
X-Gm-Gg: AZFdTZfDeuRwcE12IWOWfdB+nLerub6twTkSl/5YW/5cCTdH2KbxquaDsjP+HDHw/Fg
	JCS6+Is+OaqIeXcS9tnJPcKxauuXxB3cQXRJhfhrTgxnl07oTuSmgPzjKtNoG52ZeNayRS40rww
	ous9YYWoRp25h+hgPoG160Qr6dqvfi01irupwCc1L1nANXjjwvj8QRsdp89CTw3H//NticvZi5e
	H19cCtJSytLTJhmjI1B32xGwHWTa+GktjGSxipgZaLJLklSNwEy4zKDbGfl7LD44l3CdPQOzZLn
	6KgTbiYMMS3JIKCjI/DkpYgyaFjFpJXegYFUn/4L6ejX/kKkjrvkEXnb7Uz+eMzUB6FFCyMS1GM
	2V0MG0v7RsGfvu5O7zOUQivxVKFBEXjCZn1dnQ0tsOpQjJAO77/NQA6KLLLAZ3l3Wsegz5nBsoU
	aWnlhdv8QaLK88uQtk+fSig/J5i9b9fQjt8wm57txwx/AFi4MLQXI=
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4bb8892a21amr289651265e9.34.1795540798527; Tue, 24 Nov 2026
 09:19:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
 <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
From: Wong Steve <shyckless@gmail.com>
Date: Wed, 25 Nov 2026 01:19:46 +0800
X-Gm-Features: Aa3M54pfCokUKhl-I0LqSXGVHhsd32oCkVf6bc_7JRKNUQctTjfAfWYnwD5gTZs
Message-ID: <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Paul Moore <paul@paul-moore.com>
Cc: Martin Schiller <ms@dev.tdt.de>, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"

> the x25_make_new() function is called by
> x25_rx_call_request(), which as far as I can tell is on pretty
> analogous to an accept() operation, is that correct?

Yes. x25_rx_call_request() runs in the receive path
(x25_lapb_receive_frame() -> x25_receive_data()) when a Call Request
arrives for a listening socket. It is the X.25 counterpart of TCP
creating the child socket for an incoming connection:

- x25_find_listener() finds the listening socket,
- x25_make_new() creates the new socket and copies the listener's
  settings,
- the new socket is queued on the listener's receive queue, and
- x25_accept() later takes it off the queue and grafts it onto the
  socket that accept() returns.

This runs when the packet is received, not on behalf of the process
that later calls accept(), so there is no process to take a label
from. Without the clone, the new sock keeps the default state from
sk_alloc(), which is unlabeled for SELinux. For TCP the same step goes
through sk_clone_lock() and sock_copy(), which calls
security_sk_clone().

Thanks,
Suyuan
