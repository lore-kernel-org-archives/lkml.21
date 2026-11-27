Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817737;
	b=F4aEdLxpfpV1/yAwRq604BoWllk/9UwX0ZE3Rv+kBZxry246he2lBVM7KHSEVpfqjsg/
	 06XHjClCfTtwAlcbhZ+oBijRhIy3nywwOG1qDn0HdRpOUPBt6jgZjCDCrbdcmwgLuKfzH
	 Xh1lXBFb/BiUoTnHaCLfZpxZi5kym7fX/5q0go8l9DFcd2jlR/u/FjwpVnXlwrn7/ngXq
	 fOo4MwaC3VsQt/QVKBfZ2l0bpn86rSWS+F2CUfn9L4dgrv5MbKI5rPOASFfMu1YwYYQv3
	 F3v15NRIUeWUaCqRc49zZIHWTSQk3cbnCNG/MyZqOZXV2n2DWOWWmVDBrDZhA2FJKfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
	b=g1LIHYa2jAJRv72L2/tf31ci9jVDINSJ/oid4NFh9+swsi2A3tMNHATgnjxfiEnBql5Z
	 j1zfhomF+XikkSzYblHBFMdkgEoAklWEk1kGTBwLUOgbwO1zRvI2VACD+Rq03pB450WSW
	 GiMeW9fKKa5JEfnZJA/B1yzqeND0hjEUXpNL+D97JMlO0sGDXUmMg6Z08Ky0j2wC58zcZ
	 11fxu1nqEhXszVBBo7CpOrl600QUcpYINWDo4xSBAzhEKqEfYb4zhK1N/LLKYqwOwcZbU
	 VfVCB8hHRBGE5aI/aQbd1PlFaJIPx8d8lwH61A2HsOAy1rUPtPPCgaW0iy1sAiIbgNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FD606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso74973177b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817736; cv=none;
        d=google.com; s=arc-20260327;
        b=qNGj1VjKsgzurOCaT2pKHQ2toJo/51LdXrXJZ2ew7du65FYHiMyMEvNPK27rqfw/+Q
         mdxHp5yUOP5v+pzQS+5Xy3uEQPyQ7ScQ1MW8DjiffxD4+KWMXngDLeJJejubizpGFuS4
         bV8Nfx1BjDOyz4+i2HlcY1XovlR4FGmHrh3mYgKl4X6JZ5sovEyuWrYZkAP8LIn3I6R7
         AP2rc68zxLhqDR4XKqsCyi01kjI1dLXCbAsdg2h+Avfia4ifSmUOmRauZFWxCwJghewC
         FkGJMoQ4hSsqOcuZzP5a3CRo/Oe/hLU2cSLnuqTtQM0Fm7Ju50JvWfgvFe+IWESktWTd
         3y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        fh=AtMbpat7fbkms4NIOF4Xpyvgqh41eQsRCcj6lPlIork=;
        b=DBOo5PTiQKAyYZPDrD1OjVmN2RY8KuATVu33qxAz8Wog9m7748ThYB9CQ2/AtlOASt
         bDuoBgTylzwog9xkaBTOQgOrE0cTu1ei+Rv9rj74VALHv7yriagbzFJA8lJeEPqnTYrK
         fMVU3hvbeRxVCGrBYd+iZRrQII9UQck2yq6YOmu6o1XCMg23NHg/JInN5Bp3jeVvEX7D
         L5FTzd5CUXlL9zSyrqMab7Rm0Zcx+E8uFhs/vm95YMteCO+ZOmq1g6iFSdpG2n2hMmxQ
         p8wFuwhJnx524zdSsy2TTkfYGYYacA1tjaAZj8ZZ/EMyV293mO4Kk15j9417lsI/mm4P
         F2sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817736; x=1796422536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=R7L1PNXj/Md5qNgsN/Yom1TwNgr5cwmA81rdx25vyLc840UAih1c8rhCiKCIP4WGOm
         tw2Y0KOLd6rkQSfxmbPft1zsIJ+kM5NOrRHe/Zd2Duz2WLfnMLmPgPvoUz8aiEzeB23Q
         xVUjwqrAYPcRRvOJBgHKOZvZiS5RzLMyCRNYjLoyvUpEs/JkLncF3hIAMGTsYAlHKhjU
         8b/h/dl8zDLt5lyT/y/4XisjzHyiF1e9G1CEvNNcQNIQgK51pNCUqCSkBvEi4SuLYyWq
         6tTF+zEPg8f7SE9XGAUIJCZ1VSUzcE6wbEsbISRNoVEja5MS6sOt5j4BS/ozykdFKoVR
         Cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817736; x=1796422536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=IWrTodqvMh75S1QkMqHT8Ztyi5+7Q+8knXRfbDUqsp+kyTWXGX+OeDic1tDkKRMCkE
         hVNCh8iJ539drW/R56hFKzxRA1tSgqZwf76EYlQcOjOsbIN08OlSQB+Fpp5zpcDfIvM1
         JAawTRQ7y+xfusaKtJzyZqVJLRL0v2bPQODGor0inaqJS6tc8uJB+kadYCt4tGe5zv3L
         9FZKfRpQrKzPjudvEDEVk9KUt3Hsp7lUt1paTJcsjkGxwH9aC01RU7yZ3qVubs3XCc2G
         TN6hR9PHod+WpmgBOWbArZRDkmaBQBVyB7MSfAlO9mSXNH7W8b+uFbDJtHKLMff8E010
         E7VA==
X-Forwarded-Encrypted: i=1; AL+hErFOrmMJz7sB5e4BjbKFe++VSax9YXnUq0I8VMmTepGnzhPYsm9qxEwxeXd61YGOdX1NEQGwGvbbS8IDbas=@vger.kernel.org
X-Gm-Message-State: APuU4Z9egosCs4Viffc5TFOK44ZByQIcDEFS6n5aYjxg5vJZ7Ku1RcMm
	86U2S1I2MZ/4yVNj92tQ5kG5SdV2nfZjANP3U+G5GOO+bXmQkRHP1dlbQ/Ds07yWqNBHgvsANQ/
	3NtetTwzbsU8cvKdqgX3A2BUltheO5ONAlXdDvFSaWw==
X-Gm-Gg: AZFdTZfgfSrUEZfOnYCepowKOgUFalvbjU37iFrl/Rgadn/EP24g5EChUNRdvsOVevx
	mGIIBMrr12lJOXS0EQpQVuWL4OjfCKK4xENKejiCip1aovCAqGpx9PzVNMROdoGBFn7OqbNlIKG
	2zGTXUcF3GHXBAoyPi1yxUEpKqYVT5niliIu7oE4ciRoMRd90fjpHoy/F2tInJRe8FpzP3tQ1Gb
	k9nmJgqik0D/YP5rITwc/h7TTMkhtdCdlL1Vi01sJkgWzsD/cNlh9YZDWUGBTtvQWB/uBMWWq+l
	CIgkmyQ2mM03JNBzXhIFJYgQe4R0hwO/R4mVoj9Joh0Cngp2RhU7JClPSXSwbG2Q9mn1mk3tOzh
	RHBvJ+N8hA4CXwDGcBft9AD/04fu2zjmUiguDHXWyXjzKJCaGCX3vQm8PdG1g+GQP/17R
X-Received: by 2002:a05:690c:3607:b0:8b5:6e9:217a with SMTP id
 00721157ae682-8b5204a997cmr118432657b3.31.1795817735925; Fri, 27 Nov 2026
 14:15:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai> <179572802703.3135.17411865692194388871@kernel.org>
In-Reply-To: <179572802703.3135.17411865692194388871@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:15:22 -0700
X-Gm-Features: Aa3M54p1KHSs9ceXPdvDTdxL0WR7OjSk7c2s4dSWeaRL6V-xTBYAqdTwA4fWcno
Message-ID: <CAAv61uR6XcazqvJySkz3SRHTmw3f8N-dV1xJUqO_RNbXxHK3mA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add tcp_l3mdev_exempt_ports
 test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:20=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The header comment of the new test script
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh (lines 8-9)=E2=
=80=A6
> - [Low] In vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh, the first=E2=80=
=A6
>
> --
>
> selftests: net: add tcp_l3mdev_exempt_ports test
>
> This adds a selftest for net.ipv4.tcp_l3mdev_exempt_ports. With
> tcp_l3mdev_accept=3D1 and the port exempted, it checks that a VRF
> connection reaches the VRF-bound listener in either creation order and
> is refused by an unbound-only listener. It also checks that default-VRF
> connections still reach the unbound listener, for both IPv4 and IPv6.
>
> > diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/t=
ools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > new file mode 100755
> > index 0000000000000..da7f20bf2e9e6
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > @@ -0,0 +1,260 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Test net.ipv4.tcp_l3mdev_exempt_ports.
> > +#
> > +# With tcp_l3mdev_accept=3D1, a listener that is not bound to a device=
 also
> > +# matches connections that arrive in a VRF. For a port listed in
> > +# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VR=
F
> > +# may take such a connection. Connections in the default VRF are not
> > +# affected.
>
> [Severity: Low]
> This isn't a bug, but is this comment narrower than what the kernel
> does?
>
> Documentation/networking/ip-sysctl.rst describes tcp_l3mdev_exempt_ports
> as:
>
>     only a listen socket bound to the L3
>     master device or to the receiving device can accept them.
>
> The check in compute_score() (net/ipv4/inet_hashtables.c, and its twin
> in net/ipv6/inet6_hashtables.c) only rejects sockets with no bound
> device:
>
>     if (!sk->sk_bound_dev_if && sdif &&
>         tcp_port_l3mdev_exempt(net, hnum))
>             return -1;
>
> A listener bound to the slave device (veth_vrf here) still matches
> through the sdif comparison in inet_sk_bound_dev_eq().
>
> Could the comment say "bound to the VRF or to the receiving device"?
>
> Also, none of the cases uses a listener bound to the slave device, so
> that documented behaviour has no test coverage. Would it be worth adding
> one?
>
> [ ... ]
>
> > +# Start a server in the background. nettest sets SO_REUSEPORT on its
> > +# listeners, so an unbound and a VRF-bound listener can share the port=
.
> > +# $1: IP version, $2: "vrf" or "unbound"
> > +start_server()
> > +{
> > +     local args=3D()
> > +
> > +     [ "$1" =3D 6 ] && args+=3D(-6)
> > +     [ "$2" =3D vrf ] && args+=3D(-I "$VRF")
> > +     ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" -t 3 -q =
&
> > +}
>
> [ ... ]
>
> > +             for order in "unbound vrf" "vrf unbound"; do
> > +                     read -r first second <<< "$order"
> > +                     RET=3D0
> > +
> > +                     start_server "$ver" "$first"
> > +                     pid_first=3D$!
> > +                     wait_listeners 1
> > +                     check_err $? "first listener did not start"
> > +                     start_server "$ver" "$second"
> > +                     pid_second=3D$!
> > +                     wait_listeners 2
> > +                     check_err $? "second listener did not start"
> > +
> > +                     connect "$ns_c" "$ver" "$addr"
> > +                     check_err $? "VRF connection failed"
>
> [Severity: Low]
> Can the first server time out before the client's SYN arrives here?
>
> start_server() gives each nettest a fixed -t 3. In nettest.c, do_server()
> does a single select() with that budget right after listen(), and closes
> the listener when it expires:
>
> tools/testing/selftests/net/nettest.c:do_server() {
>     ...
>                 rc =3D select(lsd+1, &rfds, NULL, NULL, ptval);
>                 if (rc =3D=3D 0) {
>                         rc =3D 2;
>                         break;
>                 }
>     ...
> }
>
> The first server's 3 second timer is already running while the script
> does all of this:
>
>   - finishes the slowwait poll
>   - starts the second server through ip netns exec
>   - polls until wait_listeners 2 sees two listeners (up to 2s)
>   - starts the client through ip netns exec
>
> On a slow or debug kernel (KASAN, lockdep) these steps can add up to
> about 3s.
>
> With order "vrf unbound", the VRF listener would then be gone. The
> exempt port makes the unbound listener refuse the connection, so the
> connect fails and rc_vrf is 2, even though the kernel behaved correctly.
>
> With order "unbound vrf", the unbound listener exits early. The
> check_timeout() on rc_unbound then passes trivially, and the subtest no
> longer shows that the unbound listener was skipped.
>
> If wait_listeners itself times out, check_err records it, but the
> subtest still goes on to connect.
>
> Would a server -t larger than the total wait budget avoid this?
>
> > +
> > +                     wait "$pid_first"
> > +                     rc_first=3D$?
> > +                     wait "$pid_second"
> > +                     rc_second=3D$?
>
> [ ... ]

Thanks. Both are fixed in v3. The header comment now says "bound to the
VRF or to the receiving device", and new cases cover a listener bound to
the VRF slave device. The listener that must not get the connection is
now stopped by the test after the client connects, instead of relying on
its timeout, so a slow setup cannot make it exit early.
