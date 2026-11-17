Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938950;
	b=umOsdj+uwPAhnoNz2CuSMZ3RJEyRDRCSv87zSRcUD769UnrqRdpAqc2kp4LknNplaQNY
	 8ry6f5ft4YS8f9Eq56zQm12NLzDIfW4K72UkMSdwOb/GMSRDWmJJ5of8BWd+OGfsdqtHa
	 CFkY7rFQMw1qIRy55hiXQrftCVESQbEvA/v4o+bi/y1M8gr0hlK/72ouz0BpfljnQgp2t
	 wuYIDIfcTxbeeqwv1BozZklxNBww8aIqIdVOvpuN6bGHYX3YP6HsxvcMCPShZhvUzgKGF
	 50OaTAs+XBhp7i/GMAQAe2w9ySbB6Ws3MScPA0k2UnLHxd5mbzF7OVo2jOkgFEyY1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KKsdQL2mRK075sufcf/+55awhoPGBQkWp2QNwCCRPwQ=;
	b=3ngFq0DFmdJyU83HWpB2pVf5KlrJrLIkRTAfGJCI/KXKzbuzde/P7URid50yZeqzhBDJ
	 l7nFOdD1Lr7D7j4pzCyhOIbVZloCC++CtfU50VZAwRSeUVqqBOqdB45728tvtq6KCkdQq
	 Ujdz0IX7VX2C7xC0fJB3fgJ/v/X4nFR2TQGW3qc/JA1SsyM2IoyJ+7mtrkJnrSUsSQw5v
	 ugoCrQy4PS4A0Y+e9n5y4Q0G6vwEW1U8VO2yXBmIOwxvGZlfcklmtYETDa9gmSKb2Xs5c
	 uPGuplkB9wRE96ctzNbO7UlKb7PA4diIZtni/U83nUyXZcw2ctLEJhol4MOcX8PCGVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=R9LpnGom;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D298F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=R9LpnGom
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eddafe648aso182465ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794938949; x=1795543749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKsdQL2mRK075sufcf/+55awhoPGBQkWp2QNwCCRPwQ=;
        b=R9LpnGomKKsF7xD3DVdARb5Ry3QOZQbA7bQLJA3vhsX7zZnFvb/6kRINA0nP6ySwCE
         aMYFhS7qA4K8ickZcwuViWWyZXLMvmrpalEMwPROuE8LPhMleJz3SrP8LQ02jpRRq0rI
         ++2j5yqEaLP2qFTWVbHqwxPOmBQqK1SrR4ZBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938949; x=1795543749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKsdQL2mRK075sufcf/+55awhoPGBQkWp2QNwCCRPwQ=;
        b=WUft9+q4kIO5IMBqLrW61yzLG1wH/JE0xAYPldFfTwhdaPv4XUYYotc9GBCncQLpOb
         4lyahpzaUgtRZ2c2BP54b5OS9F0L3vRDTuQEKLunnOBDNSBU1aLSuJ4Agga5yHqajna+
         2jxOe6Sp4GaagEzomF57nUzq+HEY0jul6pFuUgRnlC2pTEk0eJOIf4YE8EeZQ5pc2oaL
         osI17rO0VBLl7gGDRSnhgeBOqgn/cmLt4zCop+8oVUK1DYctlEUGQ+zYTnuMehwv8gPL
         g6i2kSXSD427oY6vwRfCHH3Iq24vXxeJbLDGjayizX+1DU50Ul/aTLyBN5bwILxjPjQf
         vFkQ==
X-Forwarded-Encrypted: i=1; AL+hErEN0UWAghb5VRFsAlW6vSTf7HPkfJ2Fjm1Hdel+Ts2v1F3u+4qWdhBHd9Sdkk+liC0XfjfGbBJ+CiEJibg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/saLGM5vomt9qkuIb7qhcRGbBMZAwEpvzUyn792oh80eK1jdAm
	5v387opXJsFTB1k1jrPtIMMWShCi5eeVO0Y1EJ288CuFvw+1huisFPXLRTi4jRx4U9M=
X-Gm-Gg: AZFdTZeDsuRc1GpzVrbPhdZ3Th1/juS7KoHGQK+7Tqf/Li9CFiLeHtlnn7Faj/BE57O
	sEdwBnEYMcaRqQlT8O+va3Xgt4+EIp0e9dLUUQmLKrnfRA8204DvQD9M3GZ2EZ+QnjTUZT7TPv/
	Mw7JxxgL3Xc/oBnYvEBFNWnR5Wey19Jw7z1Urz5sZO84DSCOl5j2JnFlthW9fYRTtw+XuNXEEIr
	E30BbiqRmnRwjbUTyqa2J1UrjweavGIguYlhC+7X1h0OH2m0JmczoUqoUkDnMFxQQ1Byo2qs9QU
	vug05b4p+UzDJshrJZJYJWkEEqCiMvpCHPHuxi+q27MZGnVfvFzwdVo7RWA3ZQ/STVz0QeA/98u
	9F481+bCUwKXNz2qWVwoPfSvZ80rCPFAznJe2IWLMYSaQ6Vdd5RGezXnbJVxXUBPp6HI1V0wO/s
	v3hmz5KasjelwdCk5L9AmSCpMrGSjCEVI6+v0flI1FjtbaI6NFuqwbf8veDfnMnxEjByLAzDpl+
	jdkhJlsZ/CcyIH1MIcY9PFLnUEZcAj8o2nbyoA0IuAPV8JW8ciWzyYdrTYVxYbXwf0wJzwksBkp
	gcOmpYwqY9M466fyw8oBcad2NR0UNGa89Rqa1w/smRY0pPt452xauhLFykAJGNHpwW1fApYOBV0
	sTKFxlgb6OH+sEiixD5wnafFv3xTztcL8mUUXNpviHkG8PDGVQIOPuPNo24MdKnBJ
X-Received: by 2002:a17:903:2987:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2eff757a5dfmr811935ad.55.1794938948952;
        Tue, 17 Nov 2026 10:09:08 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff623c4c6sm1178805ad.54.2026.11.17.10.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:08 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: piyus@iiitd.ac.in
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kapil@presceralabs.ai,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [BUG] net/sched: act_csum: slab out-of-bounds read in csum_partial()
Date: Tue, 17 Nov 2026 23:38:56 +0530
Message-Id: <20261117180856.363203-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112075159.3552470-1-piyus@iiitd.ac.in>
References: <20261112075159.3552470-1-piyus@iiitd.ac.in>
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

Hello,

Resending: my earlier copy of this went out in the patch thread by
mistake, so here it is in the [BUG] thread where it belongs.  Apologies
for the duplicate, and for the noise.

# Revised Impact Assessment: A Kernel Memory Read Primitive

We need to correct our earlier assessment of this vulnerability. Our
first report classified it as an availability issue; the second
described it as a 16-bit oracle. Both understated its impact. We have
now demonstrated a working, byte-exact kernel memory read primitive. A
single packet can disclose 14 contiguous bytes of out-of-bounds kernel
memory at an attacker-selected offset. The mechanism and its limitations
are described below.

## 1. The root cause: An unchecked IPv6 Jumbo Payload length

IPv6 normally uses a 16-bit payload length field, which supports
payloads up to 65,535 bytes. For larger packets, RFC 2675 defines a
Jumbo Payload option in the hop-by-hop header. In this case, the 16-bit
field is set to zero and the actual length is specified in a 32-bit
field.

Our packet exploits this mechanism by declaring a payload length of
4,294,967,250 bytes, despite carrying only 56 bytes (70 bytes including
Ethernet). The packet is structurally valid, but its declared length is
inconsistent with its actual size.

In `act_csum`, `tcf_csum_ipv6()` reads the Jumbo Payload option and uses
its value as the IPv6 payload length. This value is then passed to the
UDP-Lite checksum handler without validating it against the actual
packet size. This is the root cause: **a packet-controlled length is
trusted without being checked against the available packet data.**

## 2. Why the existing checks fail

Three checks are intended to protect the checksum operation, but none of
the checks catches this condition.

- **Packet bounds check:** `pskb_may_pull()` receives a length
  calculation that overflows a 32-bit integer. Instead of checking for
  more than four billion bytes, it effectively checks for just 8 bytes.
- **Header length check:** The declared length is larger than the header
  length, so this check passes.
- **Checksum coverage check:** The UDP-Lite coverage is compared against
  the inflated payload length and is therefore accepted.

Consequently, `csum_partial()` is asked to read 200 bytes starting at
the UDP header, even though the packet is only 70 bytes long. This
results in an out-of-bounds read beyond the 704-byte `skbuff_small_head`
object. Importantly, a large UDP-Lite coverage value alone is not
sufficient to trigger the issue. The oversized Jumbo Payload declaration
is what bypasses the bounds checks.

## 3. Turning the checksum into a memory read

A checksum by itself does not reveal memory contents. `csum_partial()`
returns a 16-bit sum, which provides very limited information about the
bytes it processes. However, the Internet checksum is linear. By
obtaining two checksums with coverage lengths differing by two bytes, we
can subtract the results and recover the intervening 16-bit word.
Repeating this process allows individual words to be recovered.

We verified the arithmetic against known memory contents, recovering all
131 test words without error.

## 4. Why the read requires a single packet

Our earlier attempts used two separate packets to obtain the two
checksums. This did not work reliably because each packet gets a new
socket buffer allocation, and the memory contents change between
allocations. The solution is to obtain both checksums during a single
`tc` filter execution, using multiple actions on the same packet:

- Compute the checksum.
- Mirror the packet to capture the result.
- Adjust the UDP-Lite coverage.
- Compute the next checksum and mirror it again.

This allows multiple checksum observations of the same memory region
without allocating a new packet buffer between observations. The
kernel's action limit restricts how many observations can be collected.
We reliably obtained eight checksums, allowing us to recover seven
consecutive 16-bit words, or 14 bytes, from one packet.

## 5. What we have demonstrated

The following results were obtained using an unprivileged user (UID
1000) inside a user namespace with `CAP_NET_ADMIN`. The kernel heap
itself is not namespaced.

| Test | Result |
|---|---|
| Recovery against known memory | 131/131 words correct |
| Consecutive words from one packet | 7/7 words recovered exactly |
| Out-of-bounds reads at coverage 1024, 4096 and 16384 | Non-zero, varying memory contents |
| KASAN validation | Confirmed slab out-of-bounds read in `csum_partial()` |

The demonstrated capability is:

**An unprivileged, repeatable, byte-exact read of 14 contiguous bytes of
kernel memory per packet, at an attacker-selected offset within the 64
KB reachable region beyond a 704-byte slab object.**

## 6. Limitations: Can multiple reads be combined?

We have not demonstrated that reads from separate packets can be
combined into a larger, contiguous memory image. Our experiments showed
that successive packets did not reliably access the same memory
locations. Even overlapping read windows produced no matching words in
the tested configuration. This is significant because it means we cannot
claim that sending approximately 4,682 packets would recover 64 KB of
kernel memory.

However, these experiments were conducted on a debug kernel configured
with KASAN, KFENCE, SLUB_DEBUG and memory initialization options. These
features alter allocator behaviour and can significantly affect memory
reuse. We have not yet repeated the experiments on a production-
configured kernel. Therefore, the inability to combine reads should be
treated as an unverified limitation, not a demonstrated property of the
vulnerability.

## 7. Conclusion and disclosure status

The impact assessment should be based on what we have demonstrated,
rather than what we suspect may be possible.

We have established a repeatable, byte-exact kernel memory disclosure
primitive that works without root privileges, within the stated user-
namespace configuration.

We have not established whether successive reads can be combined to
reconstruct larger regions of kernel memory.

We are holding back the detailed reproduction procedure and programs
until the fix is merged. The patch has already been submitted upstream:

- **v1:** https://lore.kernel.org/all/20261112075445.3555341-1-piyus@iiitd.ac.in/
- **v2:** https://lore.kernel.org/all/20261116182108.2581258-2-piyus@iiitd.ac.in/

Version 2 contains the same patch as version 1, with an expanded
changelog.

Thanks and regards,
Kapil Vaswani
Piyus Kedia
