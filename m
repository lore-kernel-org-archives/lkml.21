Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795635424;
	b=CowMCTlVm3Y8MAxDO0Bu2Ru6tOzQECaf6qH/ppyRc0uaehjLusoBR18AXs9mgehd+5gp
	 raF1Qkc7Y55Hb36hjvMXk0wPUlaNKX/kjVS/6w3AnintX/Us8y8UpG+7h1NW6M5e0879D
	 K0FUbLjuaXPF7vdLnlCiX6PhBmgoyqiRKeZZTJiWR40MGmv2QuUJDWexMoAjSi243+F62
	 HGTAGnIGuh/lDf9JUFpm61ApKWB4G+kGryBAo7GqhOU44pmEB4qn8xjb5b52ta97iAKk/
	 hD4ULtuaXVsbj0iC2wjp6REBlhwCP8vmTDv37S51YYoa0oK9cUq4784ZAORshjGwxsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635424;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=GcUWDnzDkVt7oeg7/27sTQCRhtqfS3EL+mXeYyoBPT4=;
	b=hbquxlS9Z4AHi3qoAmBxZm2I+RVXrWwciYZz71/a1P4YgbcdwASLZqf6b1e9VAoLGAsJ
	 eKZ9qOpzIcwzIZ3dP1SIZd2q6dGr492JPc7/QH9M1/DqMcshJRXf6Qef9mYPWXJmRD7os
	 BeZZ/WcVa1/bEA+ZsN5oswNHoPbA/oeLGmvCKo5VePMVNFzyKVDjXUoD3yonsS8cpGhjB
	 InNHXJnYc1rw0FIV23LGKq7afdlsKJ1YftaFHPkWp+36Kh/X0gw9QtAt0xV8zlxbbcHkC
	 uojZvkQuAViozRb9hv9z0slYZmjOcUi+p2EdjYJ2jRlYgQG1kwDzjVdMGNcSNwvddvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="hK1F/yFe";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LnnUGHhd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40E606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA40E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hK1F/yFe;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LnnUGHhd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795635423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcUWDnzDkVt7oeg7/27sTQCRhtqfS3EL+mXeYyoBPT4=;
	b=hK1F/yFekk85jP6qxPwF9yB96f1/Lj5rwj+9Mgm+giYv2GLEA5ITQSknvHFvqcRhk3hao7
	eP3G063XTyOf1zd3rTo8f48qy/OT/qk+KQEKCuaLSAlj01NJuFeNNmM8XBEETSYBfJExYc
	/Resb390d3kHjxzzhP4uP/uabxoJG1k=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Lzs62f2NMtuVUxGl_MKgOA-1; Wed, 25 Nov 2026 19:37:01 +0000
X-MC-Unique: Lzs62f2NMtuVUxGl_MKgOA-1
X-Mimecast-MFC-AGG-ID: Lzs62f2NMtuVUxGl_MKgOA_1795635419
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ad00533aa8so23376121fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795635419; cv=none;
        d=google.com; s=arc-20260327;
        b=U2mLAZcP/zgp9gVWg+CnbPvsdapB4ulxsjnNts6N3ND/SkwJhRgjH3JBPuW1EqD4sn
         e6Eyd+1FmnN6cErEBnVjXjwhWt1ecA9fxSiFkXuD+OudF1NnwmUWYO80oma4Pr+sQ0OW
         PPker3/MH+7IRz5BtlmQmgAZ+vvFMzPpDgd8543jdV+g3nR3d38acdg8SZIRaZR/wTkD
         kRZroJPHxPqR6hTj/BAOAGwRvRq/LYZwvkRE7pfZCeqm1jjqIwC4w4aFM6LlrJzk2cWI
         spJw2+7n4IoYHx+q1Rr+nAvKy8ll1P6eQEqitIGeFq7DrqQmfK6UynyFL+0vffprKJzD
         rxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcUWDnzDkVt7oeg7/27sTQCRhtqfS3EL+mXeYyoBPT4=;
        fh=OUL/fBZ9nPT1eCP0PHhkTvi2y+/+4oTrBUR/U6Z1Fi4=;
        b=niaLeex+/N4XeDOS/pLLWILa08tXPR4SownpjpUM5sQ/anyQajKAGvVvoF+jS6ukXY
         vq77Lqa/GewBc+jlxRunFAJ1wLg1riYoJT/qGMb5uPVQ+sqp321c5wzJIv4TDYhOOIFv
         /QE2dAlhmnXSAGsiO0vaX4SflcJ15onk6xEfeE2AZdiGPuxS97yLrHWWzdGLgbGtxEOy
         mXv0UqE/1cJ8heDUIGDXUhrvff8SZZ9A62oUrk18W4L7KQBYrtHh8TFQTzQhCkvmDKNx
         DNKqx4cbYBqj8KPqQlrSNdefca40RJvFkDSS7zWp8p9SCkxFPBXq59oKDfJmcagJS9Lv
         QAKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795635419; x=1796240219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcUWDnzDkVt7oeg7/27sTQCRhtqfS3EL+mXeYyoBPT4=;
        b=LnnUGHhd+aBmGdKaxvvfaPJRiJaBiMJiIlPZXF11TOZQ7KSIqYt4sGmuaHdkB7Slzb
         5A/Vt/zmSE3DttMAovcQ9hz6qKgxJ4n4eH70/3aHiYEuVA/7wXbBlphR3Wem62FjPUXa
         Vlu65fIrRtPRdneUB8KwpBlPucobugdCeoXhW9xWSQPv68ZH89nLIBx82D45acSryHFH
         WORZaAnOqkdihEIWdQJFl6E73T1vjPc6o7x6KtN802S03A3hW/17sy6t7h9D/YjqL2vL
         W2RmBtTCKtP9oZq8tF3lXxMmOWmN4tpnFaN1y40UWEIX6HMmG90IslMKcZyz09Cw33L3
         JtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635419; x=1796240219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcUWDnzDkVt7oeg7/27sTQCRhtqfS3EL+mXeYyoBPT4=;
        b=XsFm5m/SHpHfmue5eD1A2d3+D4gAXac6snihljyq65tEnxATMRAr1ynoeNAF07fVHJ
         Wil/Bixw5rEJJjrdfjis970mPVmeJlZ0lq7Ozd9dFDbpOe+D97S8z2rWxFfRN/v2OxBN
         7gludSOjYQIzdIjS7gEXGeiLzLaJBLnUrug2VCGBCeKSaUWMI9z/tqWswT/Wh+RmlTbB
         jnLpe0yenE3yb8qrATKwUrUpVWgsG70eWNR8bSOWEPEodtk3dgw7Y1wefCYYX0N89/Zs
         fL6JPS1OSy19KdBNs9T2iUSUsSGoCHvE3fU0DUbpEjIXiCoqNws/Jji0g+AGpQ5UUSM0
         YbqQ==
X-Forwarded-Encrypted: i=1; AL+hErH3xVK800xqLkMCpwgQZalttDBvl/0w3uyis1ZQk5UbJwq9g/p8GXBd8nnDtqfB/Ri0WUpyMt5vczY7Cz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iOaij5E6lQI7/e0rJid340lPQP+7BsBig2l6E5hK1Of2uCP+x
	Gsv7hjePoRHTrfIh/4wYUQNt89NxZhaCsD0jc4CujXBcb7RdVEG0vyBxtO5cFyNlIMl0p+ieFSY
	mj9cbouRAcG2CywazvqBeX8p94BWMoG7klWjUnaytZQPd/k98ulAuFGxnMfVKwf0MQUv5sN5VIX
	IWeVlqPT17gZ2IcD/daSBMIBsF9t9r6MquAFV8Zv9+g5yow0yCifpZ
X-Gm-Gg: AZFdTZdo5qJKJvG5/s7RfJIFsIbO52GEriqOMk/hz4cxaNqjaJWjyBZs8BzLmeND17h
	ulp/tYdHzGTzdXbG9VSmTbChsbqZob4xG/IkB85vR2QARBPClZoHjV5qBM0gqWVONsJVxPl1rJ7
	OCm6PYTJO0R1ZvdWJMGC6teJW3ee5cJM/lLsWX9oLHQnbcivW3gA1bRTCN6pzfQkev7S9T66xjM
	xbg264nPwV07TDBKh9lCmMwgevyfEl+RmydetiUR3zZqUmOeis+FW2GRB5c/ImkCFFA+NmzNFdu
	CPBKmtPo
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id 38308e7fff4ca-3ae7f9da258mr64723481fa.11.1795635419463;
        Wed, 25 Nov 2026 11:36:59 -0800 (PST)
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae7f9da258mr64723371fa.11.1795635419081; Wed, 25 Nov 2026
 11:36:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-bug-dm-thin-rcu-gp-v3-0-c80ecc475e1e@linux.dev> <20261119-bug-dm-thin-rcu-gp-v3-3-c80ecc475e1e@linux.dev>
In-Reply-To: <20261119-bug-dm-thin-rcu-gp-v3-3-c80ecc475e1e@linux.dev>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Thu, 26 Nov 2026 03:36:46 +0800
X-Gm-Features: Aa3M54ryKxKVSmorfBxjLDQtyNoAMSUrA6jEU7od1eZdQjmBhLAxQmPD6h-MRb4
Message-ID: <CALjSBEt-KJ5a_vE9PJu=O1WyBY-Lu=L707opvOTL7411EZGrBQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dm thin: free thins with kfree_rcu() instead of
 waiting in thin_dtr()
To: dm-devel@lists.linux.dev
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, linux-kernel@vger.kernel.org, 
	Qiliang Yuan <qiliang.yuan@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:24=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> thin_dtr() takes the thin off pool->active_thins once its last
> reference is dropped and then waits for a grace period, so that
> requeue_bios() and error_retry_list_with_code(), which walk the list
> under rcu_read_lock(), are done with the thin before it is freed.
>
> Removing a thin device thus waits for a full grace period in thin_dtr(),
> although those readers only need the memory of the thin to stay around.

For the record, this holds only because both bio lists of the thin are
empty when thin_dtr() runs: the thin is suspended, inactive, or no
longer open.

Without the grace period, the two ref-less readers (requeue_bios() and
error_retry_list_with_code()) can still be working on the thin after
thin_dtr() returns. They access only tc->lock, deferred_bio_list and
retry_on_resume_list inside their RCU read-side critical section, so
kfree_rcu() keeps everything they touch valid.

The empty bio lists are what make this safe. With both lists empty,
error_retry_list_with_code() ends no bio, so it never reaches the
target or the mapped device, both of which dm core may free right
after thin_dtr() returns. Thus, kfree_rcu() is enough.


> Free the thin with kfree_rcu() instead of waiting for the grace period.
>
> Removing 100 thin devices of an idle pool with dmsetup remove takes per
> device (mean of five rounds, min-max of the rounds in parentheses). The
> queue freeze in del_gendisk() waits for a grace period of its own, which
> the one in thin_dtr() used to overlap, so only part of it is saved:
>
>   before (ms)        after (ms)         change
>   17.2 (17.0-17.4)   13.7 (13.2-14.4)     -20%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

