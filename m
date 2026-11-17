Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938423;
	b=AIzsesLdOWzG37eVG+9T6uh9enXS3wJoPt5pFhQgP9sG1wqKAvCFLL5FHJNYhMsGNCxh
	 QwszO8rRzF0D2a/cTHfH7lCovKEkduatLdd/DotU7NIwXPD2Blkx0AXpqB7WTNv1bjEie
	 ffXMWbBBKbOl8Anc2QTGBPvBfg9SeyXT/IMAc7KdDT+6tb3BbOo5hDlOd8qmh8hwbD5xI
	 0iZxlCKvJMncB/VNKTLPhJk4qFA6LCUW85a9Itedy8tXMo/9KZ7S+R8cSqbc38QIBwgqP
	 CCPcMjd/cRtmPRbYfH8Kl7zE0Nf63La6iGhL1OoTE26y1jfSl9RA5BFL/bTRt7l5/GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeLpAGkjUmgjyXxw2yEEozxedkII8BrSx+c1KwTE3W0=;
	b=xz1qI/l8i3ME6W5lN/BAHMTK4EYY7SXKWgF4rvj3LJ1IlJn6VLEN+tBg7yKn43STkpEs
	 k4Yy/uc2SfhaUMsdTuXYnyuLX6kGPm1SIoub2ao7RJXezzO/u7m3l0ZTYnv62rxYZwFO5
	 CU5yGWQYsg4ZOQqP6gl+mHulG91AmPjCad2aXNwqU2V61+0UmWy3kgf6SqQpwmm9+MBOC
	 edm9hiIC3HMF+grbpBpe8Y6vikkTybJGaLOXnp3i5P8J61+tFvOVrOpnVPl2pW9xCvGeV
	 dSiK8In9DLyuKYNE0dKyP+iYflOxaUA3IINd6jGEOwv1DK7YAthuGgGPp94s9AH1qdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B7V9UVxW;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D86A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=B7V9UVxW
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efe8f50697so202025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794938421; x=1795543221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeLpAGkjUmgjyXxw2yEEozxedkII8BrSx+c1KwTE3W0=;
        b=B7V9UVxWTVS+HGI3zKBubiY3nTnLBrFUmnxkZE0WByRcNYisE2EBXk4joloCo2h2CY
         koFpb+yxnDv2TiHvQA39BlMQ99EMsG29Cg/q7Ex39ZsjMCkmdDuREOpIEEkS4FHq3+7U
         aBLstqowtkFkeQbNtqnS7SbcmUxaBRGa8GDhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938421; x=1795543221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeLpAGkjUmgjyXxw2yEEozxedkII8BrSx+c1KwTE3W0=;
        b=2mM132LE6ctivWm57RuBe0mieYVwNi4X7QL6oXawAD46KlMLsMTcmYsBqM8+i1UYD1
         O1/OZYCBUAJGM/jqVV02STLB7zp5Hx7MrdH27gwCXnKrE+kFHjyq5SS8hbEI326LEV8L
         SIKNTCFeQOdnc2jmm4e0YV2SXqPdZldr1myMP9ZvEY4Aql1CH+gIwnm14MvPoW1q3VXJ
         BzH0cCHXoQW/TORnwr5AQWDSN7aZIYKgYZ9XgroqngRPnul8wTrdMMozTHksNV1e7Yc4
         myNFwKzk1Cd6JCDERrTQicc9Il0HE+MOhwGlnAZkt3xCPFZ9vBvFF1YSivtO5VTAN3iH
         uCsQ==
X-Forwarded-Encrypted: i=1; AL+hErEW71CeE1xhWHk2OfN8HA8K4/m82yV5DSNpYx1b8dX0ThHhlyPfQhGGXOEN7t7Ow3nh1u77RPWJssiiI38=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Sr4HF02zdLwyo1AHPv6rZpCBW7IXBIm2yZjj/rNicm8rM/4k
	0IqqNK+U7j7bZe4a4TJQqAyLYl4ljSQvCKFx2sH4H02+n65JEw1OZYcs7Q1Q3x7I2ow=
X-Gm-Gg: AZFdTZdO93F/Id9dJNK5jeEa4lucwkRbCwrDcVrf775olwZfSVcdF/ps/DyINW95taw
	g3+h5eiubuuzbujXMDtZyC4uM59DGO779La2GdM+6I8T2UJqM3gJUsX+KQnoPNo/RGltphFbITr
	ZiEJm8mlfn2aXnCHvbx2KCIGqDuWAPSdFknzbmX+k5zfBDlz6V7Ej5r4Mq+JM2doYpwpRDRUEgd
	Wj4b6AnxGKtD9+tSrs6Y03D1BUkU6AaZ1NCieqNyxci0/oZh4xTZIgXNejTOIchvfC1SWNzv756
	4B430PAB58IKm7PR5dhJo7s4tImc06fFaC8yWvqOR4VMKCrTjWvmtWtzzy+OqNlI6kmgUedS35a
	OnyQ08m4zusCVOPcYGWkMulOLHKvi1PYnjKFTBC3ve6RXUcIHIoNxRQ2BhnMrB2DhxKaSXaY7F7
	AY+h59XwjRdLvXuk+uTXvMiLEMswxX9tgo8D8RFHXWd+OPbl8k81Gs21H9UIKQzY+kS5deTvPnM
	krImaGFU1Mx65a7uhBzaxhxun82qDspbT27ZMnqfNxtnUGT7btOB6VitYMBkq8llZ99FCyYsZI2
	4je04wm1Nw8iiqnSvPXlOpCVsdOS4AiyaasamruCV0D/poO97NPM9PjqH5+k9rrn3EikJryjRmE
	qppUbM9XqDG4JKBc3oKr2rYjEJGSz2ooDxcU1T7a0eh27BbUD5KfEniM79na4mUXD8B1I4FyKxL
	UTCeAmWBYPHQ==
X-Received: by 2002:a17:902:f652:b0:2ed:218:6043 with SMTP id d9443c01a7336-2eff754502fmr581835ad.59.1794938420590;
        Tue, 17 Nov 2026 10:00:20 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62833b1sm1068085ad.59.2026.11.17.10.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:00:19 -0800 (PST)
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
Subject: Re: [PATCH net] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Tue, 17 Nov 2026 23:30:12 +0530
Message-Id: <20261117180012.353227-1-piyus@iiitd.ac.in>
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
