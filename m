Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878428;
	b=Bl6mjyWlZJlkQ8QTL8rvAGa8aNhTyseXowSMkStjnDXNm2Eg5ULHIMT3hGHfTDlvWTkb
	 g1XfC5/MnAWc/s6OEdwV0jzPD7Jhbw43BVnIP4cE/Els/Nd4DA2WCB+kFEwKmhAPEDXU0
	 HgMewMoFgVFZIVtLXaV4srnf5Yn6hbX/TwiGeikuwXmw93Rmv1nrxNnqi4+eKulj/ppo9
	 poWW8eVvs1jiELqShIC1WSUm5EHk8J5HMirYN4G/odplqLWYWMB8+N/VFfQe3Zcz1R4v4
	 ja9oHEH0tHdY8/jGzvz3ntSxXz7f/NLBoUKd2aeNQELZqonMYdNI5ChblheZmvG6xOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
	b=NFpgRVzFu+4y93MSHGF8HLg9DHQ4X3LtEcQwurscFLmyzUdQr6Qlsliq15n2eSVa+G7n
	 mL1FibPnzX9Wrs40ypn8d4AuEoOHW4elfW4SflnNwcM0g0qX1EAFXEimBV9Ts/gz8Np89
	 PBx2ULmUYDErHm//3kgfjKZBqEK9PEOfkerkP9ttAkhLYhF+7N2TSaf5TpyGyyO8YNJX/
	 ApgWM8lhGhkZrihiwZC3pxGVTGZiImLhfA6nMzOWhuHztA0Q76TYZEpl4iU+n2Z70aHge
	 e3PaVtL4QcjybPvm0yWglvxVeyfqGqCx6TTpK1mv766RRsYC3CAasRwYmVg7dEt1/vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1948606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1948606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51d016c75dso291116466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795878426; x=1796483226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=aDiuxX8W2+gteVCIUPG/FgvvNkM7Mmoj0rNnHSgJohxEqQJzvIbLfTx0PT3mHW/Y25
         TGN/ChZmozRhlPn+B7zhaDuFTbXHvKf42CD6eJwr6loO/mR7PdYlwhxM993dIbsHCZBq
         kdwmOqCAmLxRKMLOsaMEio51Dne5WhDXBU4hIKxLXALE0iajF2wAnqTIKZRppecVMIZA
         hk3hpnONDCMiDFfVrV5ikOyIAdz7LZ9HerEyq2PLh2/814ahKeRlAns1VJKX8cJVZtoJ
         pv1RtKe0VPbq46RR18/HFS16DxTZrxjXRXxKz9cqwX2Se56qKRqwk8Bj4kPX14r8cDt1
         LWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795878426; x=1796483226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=bIOAs3RKk6GB+B80/ybdV3VwqUo4TZrTUZNgHJbxqbiecLROIAe9YRwrJg8ODwWcKF
         BEyp3Wd+XIyaou9A+cWUDM/LNJwO8Ca4L4zruc1OROb95O7M7rCQ6ptqMvXIVusGcNdz
         RTKngfzNHPdZUj+F9jv3N748M4WxjM4e+mwd3St+zNPo6snx9WrFVPhgZArC0zmLN+TA
         G9RsFTkDleWqb2t+dQShRvqABbQgeyDz5wLzYnfL4P2TndILMfbTwSQ5tH24y2IkMLht
         aHqf1LuClHJhSx2GQZiPK5l14xxuIodKTdwMCXOgnWfQvLyFfguJAv/ZHrTD2wkCVlUQ
         qCLw==
X-Forwarded-Encrypted: i=1; AL+hErGjI574v5v4/IK0/VqDQ4wTlyhXLbypKD/BxETmnTGE+6+krcpbGCFI7NVmD+fVqvUOcZGiW0kXMUZf2P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rWjAdcYrzxcUGYftCHma0SHh+1MKwY5kL/Ze8kMuta5fgucyz
	hdH6puQjihuayHlQbVAhawUhl3xD+OMzWhINg8f00VRfEC/n0ZJKn87GwbGVCHzoUg==
X-Gm-Gg: AZFdTZdDU3AY0y83NNCxg0V9QyalJjowolLTHOXOd0B77mlZpwAb0FaAlMbgV7gju4F
	OTb3/mgpSEmRiRichIfG2Oa8Dc3rbtVS/GWDp3eGRO321pqYoZf2gaaNOl9htuRIIqUXmQq2Xaq
	xad7QparSPoLM9rgixokxXXwvqY8umNnpoiprzpqXH/a1eCJMGT9sfqzUUmo6qtwEW5apBSSYvD
	o+x4jJ9y7kAeavHrmrqmF9WeisTpwleYPBD1CEDweGh3m6VjwHR4x7ExoEbwDygxxjHuSP8TnGC
	9wF3fG5oZ9BTz8L18o6xVBmI6k1XoywwEldKtxAM420DgDZJf02ybGun2nixm/WFtFErmqtzHef
	o40gX28HjSWuJBUq34wk6Oij/Ew2A3NLml/D9hrdbM/XbNN6jCO72C9HJYdOhu89VpbplEkGnB8
	FrznnNeK57ipjbJdtnelpsCt+pJ80cE8+DNYI1RonwrrBo4l4x9qn2S2vsgZ3tUEJVL1x9kl0Ou
	Ko8y+YWZD31hS88qMjo5QbSGOAC9ah7VWo7aI8+5+XqGXXS0HDjjA88kEwrZI9Rxpf9fdXY3VF9
	MZJqWoIM2r3hvD6G1H4oWnGSk3mBD5GjNwf+/WQNRkZ0gjvtJSdx9HXduK3vVlXwmDtiw3JCprU
	0aCRkBTrJubGCKDkIZZd9/JvTN5jjReLc+J7h1yK4BlZg1g+swhtgRx76gXliSv9zupleU6UstY
	4coZMuOoDGCgb5vSqD7l0HF8mkNJhp8nbAzbm1LT8DkxRYa1oNV8OBisMHxlzIfM3nbaRo6mGCF
	vm5qME/DIxeBo+vHjnEDeDQqeie6N1U6bb4ImW1UP/ejqtGijOoldHFev9QA6KStt+YxJTCfnbe
	Yd+unye1SdP3rA==
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr1751678766b.14.1795878426093;
        Sat, 28 Nov 2026 07:07:06 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm965372266b.37.2026.11.28.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:07:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across tunnels after GRO and GSO
Date: Sat, 28 Nov 2026 16:07:08 +0100
Message-ID: <20261128150708.2702219-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
References: <cover.1795284858.git.julius@bairaktaris.de> <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de> <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/26 10:51, Paolo Abeni wrote:
> This test is very unstable:
> https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

Every failing run reports missing segments; no ID check failed. The
receiver read a plain AF_PACKET socket with the default receive buffer,
and packet_rcv() dropped the frames that no longer fit when a burst
arrived while the receiver was not scheduled. v4 reads a PACKET_RX_RING
with room for all frames of a case and fails the case if the socket
drops a frame:
https://lore.kernel.org/netdev/cover.1795869698.git.julius@bairaktaris.de/

pw-bot: cr

Julius
