Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077759;
	b=ekAx6eME/J1eGXEbq/uDVg389ZvBNhxHnEOky73598MElbrV3RKUUOdeQoLPJA/Y8DcZ
	 odsCp7qFQb6ot702x+pirMc89p8W8FWXboFNE60i5abSRPY8sKLclnHHKkYjgw/+kvQ8r
	 Y56gAhJXdoLxAcS+yjdlIPRMRg+gsbu07dl9bcmkzpcXsVhbdyTMn7IyFhSK0uMGtOvg+
	 fMnQfYZWojf8tQGOcRzO1F/B806n17iXn8sdAkx640L5ueiwSuW6SxJN4EjSKElN+2iK/
	 BK7LGLAtULH+iKo8ty/8HC52AQE9lHmkibXapoHp9VreppPeLlPRYf535wfniW9ia/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077759;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iWiJbFtVqVddp2vrnL7/ZGl130GuxHSvBxEu5wOIpWo=;
	b=N+fXbq52mhVEo80pvGmoEz3uiTPuAoqhic/KAUzohNDvNjrvqzz5hA5xfr/ZP3wJK83Q
	 i4tJY/fZXu0SrqHYY3OClvUJ4Pc26zY6S7Ct3WH0Mj0JH7kqt+yp7Sxa1g2UGured6uR7
	 +Y/Da4xu7JsZVHdJNk8mbhVxayD3Cwbeo5mqD5wCTCnMvlNFL5O+tOJy445I4VPHdjZBx
	 8Ftx9l72644b2FrWXv6wIrznqB176KsvHfZCzsxAnEVgTnEyr7SG/3FiyrvgWd5mDmo5A
	 M9NGHWSHH8la8cdNQBp6IxZh6ShPvt2BsDOGivI0azIYgMy4IOIyqDscF+RzWJ3AKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q8pJCaj3;
	arc=none smtp.remote-ip=91.218.175.42
Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B742606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B742606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q8pJCaj3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vL/J4zG6bd1pCk4S7uhM04WqGErVOFa1v5NdfiiZhWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795077756; v=1; x=1795682556;
 b=q8pJCaj3gX6e+McaWww+F+gOZ7PqhkSpMuCMBqUbaupfpH6mxRZl69UsuvBvL4zwofdGOrSs
 Jvi4C12rOZ7EEWtUlmgSlR7LZt2qIQRl2RCQ34rqnibEtfTixwbrPmHOtwTfIw/O8Y8HfcDYFCU
 1tN7udbbGN9yIKHWl1y1wRTo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 42f76bb1e926322b;
	Thu, 19 Nov 2026 08:42:35 +0000
X-Mizu-Trace-ID: 42f76bb1e926322b
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 16:42:20 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	David Lebrun <david.lebrun@uclouvain.be>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Mathieu Xhonneux <m.xhonneux@gmail.com>,
	David Lebrun <dlebrun@google.com>,
	Justin Iurman <justin.iurman@gmail.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net v2 4/6] seg6: discard CHECKSUM_COMPLETE after the
 End.BPF program
Message-ID: <av62bJ3xNkvqD-gD@fedora>
References: <20261118150251.65-1-andrea.mayer@uniroma2.it>
 <20261118150251.65-5-andrea.mayer@uniroma2.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118150251.65-5-andrea.mayer@uniroma2.it>

On Wed, Nov 18, 2026 at 04:02:49PM +0100, Andrea Mayer wrote:
> The End.BPF program can change the packet through the seg6 BPF helpers,
> for instance the SRH Tag with bpf_lwt_seg6_store_bytes(). After the
> program, seg6_bpf_has_valid_srh() can also rewrite the SRH Hdr Ext Len.
> 
> With CHECKSUM_COMPLETE, the program does not always update skb->csum for
> the bytes it writes, and seg6_bpf_has_valid_srh() does not either. If the
> packet is then delivered on the same node and skb->csum was computed in
> software, for instance by conntrack, UDP can drop the packet as a checksum
> error. With skb->csum computed by the device, TCP can instead log a
> "hw csum failure", as if the device had computed a wrong skb->csum.
> 
> Discard CHECKSUM_COMPLETE with skb_checksum_complete_unset() after the
> program, since input_action_end_bpf() does not know which bytes the program
> changed. The checksum is then verified in software.
> 
> Found by manual code inspection and reproduced in a VM without kernel
> changes or error injection: with skb->csum computed by a tc ct action, an
> End.BPF program that writes the SRH Tag, followed by End.B6.Encaps and a
> local End.DT6 SID, makes UDP drop the packet. With this patch, the packet
> is delivered. Also tested against the srv6 selftests, the lwt_seg6local
> BPF selftest, and with a ConnectX-6 Lx NIC (mlx5) that provides
> CHECKSUM_COMPLETE.
> 
> Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/seg6_local.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 56c6be841e53..f7e1bbc6e9f9 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -1661,6 +1661,12 @@ static int input_action_end_bpf(struct sk_buff *skb,
>  		goto drop;
>  	local_unlock_nested_bh(&seg6_bpf_srh_states.bh_lock);
>  
> +	/* The program may have changed the packet and seg6_bpf_has_valid_srh()
> +	 * may have rewritten the SRH Hdr Ext Len.
> +	 * skb->csum may then no longer be the checksum of the full packet.
> +	 */
> +	skb_checksum_complete_unset(skb);
> +
>  	if (ret != BPF_REDIRECT)
>  		seg6_lookup_nexthop(skb, NULL, 0);
>  
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
