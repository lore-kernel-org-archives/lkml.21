Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027156;
	b=QTHHAe2NBQidHyxi/LPxGuzboTW4ZQ8tJAkK0SO3vx2aiBPSGR3HxKb+ANrHScdx7c7e
	 HLHp52qN2aJa8W/9EhS6HeiLvRmuStUJo7Tr1n6GVPdcapSNfjXzkIZwpycwbdwqTjMBN
	 +bUBNc0L+JldNOIlNjv2JAkkBcklU9NxwtbWrWTqMm2sMnt1lFdtgRw47Ee4iFSB4Qs4z
	 iXJBaCXAgzZDwVM8g5DWmZGh9i53wwO71dqRy/JP1Ixihm+guI3tLeg9ZEVz+CxaJLLSP
	 wmvIMq9/BLf7C8+KLIzQ7QbKBomYVdaZmiYePK9BW2K6i850P+/Wlunmrc1cZ+1DQCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
	b=IJvn0w2OdodcudH0UdxY0R66NpsxUqRfYz0spX06nMhh1lxNgnxmvLrInW1wPcvvr7fs
	 DKxCPlULhh0217aDFjz31O7A69LZcbihjIP3Frfe34wCNRdQpLz6ROfs2D/ImfY8jqVto
	 Q/zMeqYS2wKGaHXx8QDgjQ6/s0GagDa2pyN89gaHc9hD9Be9+RIhjoSFRSVU1jRR57twh
	 SDI/kratVHJ3rYsGlaHNe7muvy+mDJFBv0k7/y18lu/6n9J5yAu4wHn2H+zLQEuVbEV2s
	 YW7yLVRAyp/2xaF+aMBfcKsV7XHsQ0k0zoj1f1q1YB6yASmLf9jkM2+o6+9UT3rdcwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7381C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae7fc5681dso519c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027155; cv=none;
        d=google.com; s=arc-20260327;
        b=VkGDxIT3D9vhLNjX9zuVuEEZpfG7vNCbiWHXWc6+3WRhH/uXEsW7Yro1huUoHvgWh5
         PTL5N2WiI4OJEVszYms7IGdD64t14X6nBqKPs4DLckqNxtnjqS/75FndD3zQ/61W8ru+
         QEPHioYLKzyKibtnstilah4EyA9o1YfTgfpt/36Kybpjzw8oXIX5oT+FcHBz0++VBQkD
         i121YwGhSU2OPHc25rEs93GoDE7/VQKKDenVruqSx9MZNl0bFJLPr9oIwTCwaH80C+u4
         giMaWvTu7TaR4kK2saJE5gJv2W2wKbECpqJ6g5dVDsuQYmfTPV7YV1KEJPv8GI3LgN8j
         vFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        fh=JEvOoh9MVz77N06h6HQFTJ0pqEhwnJrCHH0cU4V7xW4=;
        b=WIsNDI932vw6NAG9XrOp/lSJSrY8QN6utAWNpyp4GehhU1d29neox1fZqXEchidvhP
         TxVzqetUnjLyV6/xGqAQqV0rkjiPD3DD9X5tvP7YIxX0++il2nl6jE2oU7/ZkcukDRHA
         QDipkjFzEDZ7vo+VeUhC7GwnhxAJd5ObCZTicFQgzQ5VAOTTM47cMhoq/S8J9JRlKVVH
         1MF8xYFbIX3L+DiJJ1GlguVE/xVm2J0QEh2xxAvFJtAPE/XRbfenbJ8qDUnDOBcLdJZ0
         51vAT9t1J7eoU2NMEjl37pJNj268d97Qlto8agJGTMdcYbbl6uqHNNxsrBD/Ksw2Pgcq
         DqKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027155; x=1795631955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=ZAaEvO25CR3taVZcmnXF68wjTJix97rTrAGQ68xEM0GZSJjDB9dTmNdrvjcsjM5DAx
         MrRb8zbkzIWx50PjRSz6yorIDv8ibAviTnCQVVMSFzRQKVfZDiU6XyQs5w4HPAs5tqzD
         BsgtAY1SsuWj6nr/2cFRjkySkht8K0EsTj4DWsoLRj1zxwUM6IWMeKjUq982hpNC3ZCr
         n50I+m3FYF/WfSGc04kSTIoD5lGEfobfZQ7rtJZe77/acKLaeQOrTfCWkvAi/480aW/m
         P5BBg38eh0luesS4uP/AuaPUW5Iqh2v7QaTFsq7xfoAid8Nn8HgUQTCNX+xUS9WiQBDn
         UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027155; x=1795631955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=2MwEYCgWpIwSSLkwto7rTZxEP+z+fa53srW7GUNKAC2AV61urmksuewMbGO6W6WvHB
         NLt5qiOvUCwtfGoHnJwTg2AmGJjeq4DBnXJSr39JPd1SPkCIJyLvpSqEhRUlueofV7Pr
         MfLxO4ZX0FUhVMmWdYTh/8GvRYOKSWaa38auPwrequGoRQANFoMdD7AqSuDRJcB6MM1T
         fKVIA+Q5O6KspP14tCA0eQFQbvUJ5/HpGyLDsryZUuMBylDEEjNl+WpOuUE6eoDOsOfu
         OZMFMMpPnhoTTggOjGuc+8NfcVWfzO2/p+Ziujj1igLy6QdALPpoV+eXj/Qkb6g7eiCe
         U6qQ==
X-Forwarded-Encrypted: i=1; AL+hErGlcetnnZynLJm3k9A3cpMarQfO2AwA4BoeXsIfJQ1yupJDJwbykrGTIm9QgA8io1DN9KikQ79B0FpSEik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KJc9WhTKfWi+ONPhuQXWZmQJ3eIlbz/7jLjOr78wgzmGeAWJ1
	NTDXXm2fZZMF2iV7idB+IZVHGm+Vw5AMbYbRzDiwFxJxrruB1h4/zxe4xnaKOPepuKOQQ/S4KwK
	tXQPs2pcCdKwBoUwoRMVgwT+6RzJpGaHgUh7zynPK
X-Gm-Gg: AYBFou2B79NnKLQlr+fvAl08Myt1DWsIHJJNeUZhLzNFEsMIY29hxHeE220zn/twGF1
	SeCUtuZ+qZidJmF2Ha8fAC6ZAoXquOeTPfubVZRqyzU/gSsZxj+b2m3s527YqkyRdzF8DaEN0+i
	3b7vXqM1ninKf9LpP7xG1WAbR+7YzztYnf5WR3Tx3c3USiP9WQvyXvPJzuQYqGJ0so1ITBkgGLI
	8BEZJylHFCTwyL9eRchV9AGjrfEsPveukwqMQvY83/fex5xdJK9iipBY4j4ECcG8YrbKAsEwnOR
	tiBRruCgu7NRj59YyG1RAY4zPNJfq0br+u0haz5Sh9qI3zIBBMrctHmv+z5Abes8VEsMqaweSvM
	v2WWHb+CI/QAFtipx/VMpcFNbZhed2eLdTWnq/g==
X-Received: by 2002:a05:701b:2903:b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b54d350911mr22039c88.11.1795027154537; Wed, 18 Nov 2026
 10:39:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
 <20261115131314.2d3ab96f@kernel.org> <87wlqcg85c.fsf@all.your.base.are.belong.to.us>
 <20261117163258.446a0c45@kernel.org>
In-Reply-To: <20261117163258.446a0c45@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 18 Nov 2026 10:39:00 -0800
X-Gm-Features: AclHuK8UJH3E_Epp2jjC1wv6_uDQD4oZqE2pXj-5wMybSCyzlV0cK1dXGLNdYt8
Message-ID: <CAHS8izNe7w5gcTrVW_gMue0-2HBbRkTpiqtUUcRGHZnPwiLp4g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:33=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Nov 2026 15:31:27 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > > IIRC netmem is supposed to be used for frags and memory CPU never nee=
ds
> > > to access.
> >
> > netmem covers pages too, and netmem.rst already allows readable net_iov=
s
> > ("Decouple net_iov from unreadability"); the in-tree ones just happen t=
o
> > be unreadable.
>
> Ugh, slop got in :/ I really don't think "the in-tree ones just happen
> to be unreadable." I seem to recall being involved in that design.

Oh, that was an intentional, I didn't think there was any reason
readable net_iovs couldn't exist in the future. Actually even dmabuf
net_iovs can be made readable sometimes, as some dmabufs support
dma_buf_vmap, and in theory the net_iov could hold a virtual address
derived from the return value of dma_buf_vmap that the kernel can
access.

Do you think there is a reason net_iovs can never be extended to
readable memory?

Do you want that point from netmem.rst reverted?

--=20
Thanks,
Mina
