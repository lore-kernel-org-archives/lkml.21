Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795142810;
	b=o8jxqlo+OF1EhilVsHnFaiua1ENNg8CWwYfNO7q+GBZC30yq7jlPzggEIwdJZjqtNKoJ
	 Xn7VbCrWmick9jvfOaNeP8uMJY2iagy0w7v/xUmozY1fYWOWj7IkZvTZ+PH+TpLZDFr+u
	 gJkLFZqWwT0+CNyzPiRzsco4XPSXXL8TlXSLYbn8lvZOF4VCvKX9gY0aGUVl3REqVn3K6
	 mlKAgOe59TiyrBIazqQL4sm5wOHl6OuWLHPXHtH1atqH1KrB5Vq+B/Qy/icJ8EIFTdTGK
	 jruaSFRAAd1eppi56TvfwkU7VeewRhfntv7G3N2cgxiGHCFNkYepjfknr7G/t3RvN6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
	b=TMy5oJappIH3SDSzkfPdYgewte7/F9aphik3pWC9VeDp5AUtDRTH8kdjZCZfyH8Ii3oz
	 3yTIYAySKKLqvA7BXkgkCAPOHoSN3KmQ7XWvXvtgWU1ruvIiiglTCgCtGZFDRN7eklGt/
	 HlK4VAk0XwZ8P2yaq4naWm2mcISL4T0CPbH5eLqpKV99Zp/Hhj+pGBeRihBqQpgtVQG/G
	 4RiO6h/o0LwswCE3bgpFIZymQOyF0X/pikehLwh45uQ4sS7WKrxb8z6Nh8K+30wJq9uQS
	 uKmxkZDMwsYJzlL9H4aJocTbmr+7ml5SH+lZgJh7pk6FW6Ycsv7ChxElyscrNkU4P0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqvGS8N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCB606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCCB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqvGS8N
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso514837eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795142809; cv=none;
        d=google.com; s=arc-20260327;
        b=mzBOITqfW3f9AeG8EnGnlXTV06Qpe9vOIMGslqUODC8shhM1fa/bXEE1YDu9R+rXro
         dc7wAy1MQmyEFlQJTFDKyVmKQR+sxTEovB55uTpVEwyifu3sCJlthdTeDVyURTnb733W
         3NczEwacieDCrjhJQsAgJFaOFPhBkLjDTas109nn2gyJFy3E7hKxL9mRyMkw5y1uTKW1
         ArAgXWv2EsUwy+X5NAoHofIXz31Ny4D8CADdIPQyk7DbMzUqYTWcstiNTbmffKm2mNVM
         gyHWNtkSHyvqvyrnYL1vYGZESEpzF38datcUweJxZHmOeUpyYkw6wtbbQb3sZCvdc26V
         zN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        fh=8Tdtcu8dvWQnMX7YavfLRVlGNOWeCapzrYDuFy0YkBU=;
        b=qcUFEsL7kU1wsWQAH4zdBbnGsXL/JAtapvWhEuVkY0AqSD4oBKBw6XoyDi666WUwTN
         ms/OUJm+rmO++akqN4o7TvNZMFqcU9jEoWJGZNFZalJGW2lBUJECIlbuSd/LRC3fjYNp
         LQE0s+AtCazHjVdMExNMaZZlrl2bawrut+E2PpDL2dt4sJFtByOBP9nl6v74PtQlhuhH
         +gKNqZrSWd7e4402+sc4u4H8ri/fBIhQXpz0EzX3nG0mNfTunttyhmNXRFWiR5T8eDOB
         1DsRXp7RlnC+v28mGHwgiIoJ5dv6T6doWQ2IWnnFfn0qhIH803L4UpOr8aUV8GXN53Ig
         iVPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795142809; x=1795747609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        b=eEqvGS8NSjDv/lk1dVAeRWGEh8TiPEgsovxYo2LanZz/ysbPTA0KZq1Irb7hcRkPPH
         dZSKM5hJ+MP81SnZ+0YwGi9bkP1Nj4+OFZ0Lt6OVh0NqD+8zwd2jHvx8mYlUazKKsh1m
         HPrp5gdyujUqmXeYT/G/nBelGP45z8ik/RKgIuPi3Zckw5IrXLdeVO03dmF0pTH2nmhS
         hsnbTKRCYVDZ/qt55BKdfe/Wx9Yu584hJ9b2q2mT6yR/WDdR/Qx4DXrvOm1j343IutY4
         Y47ubAtcOvI/QjaVZ/IOKNUxRBxkEueTGnwBZYTX/g37Y+CT7SGJLGI1cLuhEF7b8+Eq
         NeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142809; x=1795747609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        b=Yba/2brXERIoIOz/cn/0wPjgIkFa2JL21cEZUPIZHGm76yFjHoRsEEMhU8GrZvuxY3
         TWcDm/WLuEOFJwbuBoILl6vOclZvIcKJXzHDzwt3sTgurFZbzY7k5kogVXjeBrBYh4ae
         ZyRB6TwFiuDGe2WjblkNdPj1TvV5qOyQEfM011Raba7V2PNDWgpCEQhmN2GQFVxrVlPI
         OPsbB+tR2JhvpIiJWso2b+AEZ1aQiRUrty0sV+7+Yt7oNA5Btl4a1JyPnixD1cT1m1RD
         DIJY3VPZRNSqc3tbfxE0sOUPbWmYR/jixXy0VZupN22vy7vxcnZXQrgVU9d/7Fh11R7O
         TFwQ==
X-Forwarded-Encrypted: i=1; AL+hErGGWnCAf0NuGnknGxhD+ZwYyl/PnVGjPkoQBbdGfrQJzHv8cL8l7bYgSAmL7bEEYMHQbQHf+A2WIwUYkV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qYvBVjKgzGu/Lq3MO923HOxrTxzPn5DXD17tsS1nZ7blqZQGX
	xdxM3bzDlEBMTIGaia+WsmC7FgLRtEBl6T9X2GkgFk3H48ojpXi/8ifOqrT6fs3hBOmOlYqNHLV
	XEMrSppHAMIzlL488805/hO6kkphlhd8=
X-Gm-Gg: AZFdTZfzNaypKzj3BhO1Swqw1BQ3M9ikpeXvvvF6ckMd36RzEkRna5snXUEMyHCdxr7
	lcQbBV0jT8lMAxYcjMOBqcuXHrHvMmsyeaSlhyCSaKZFau4ks+5FJtUG77E9F/rt8AsUM7mrKx7
	sArQw9BH8+eept0krvw5VcCh01XsF8be9eISBLLeG1I7VK2anioXZy2JwDsKoyw8RfTwvf5jCI/
	ebP96wbDFFU7u1OsCr/KT0E0NiR7tq9YLsl/glsIzw6mdNwAOTiInaCy61EPGj8Wqlhuxq9IFIq
	iwg02Nv28791+TbBGkyMpq3ztkVjGZVHgQeyV6MTblZJOUNI7ttq/VHOlxVZKu57f9R0eQiBpyx
	5qLsZACLESbjGTwPfb/CEYp71tjUf/3eMoo47//it6PtLggcNrLuWqAySai9+4so/TvJ2z4hJjN
	MK7ouoAEYU9OGdObin
X-Received: by 2002:a05:7300:e9cd:20b0:36f:f3b7:6dee with SMTP id
 5a478bee46e88-3856f148099mr1509811eec.7.1795142809415; Thu, 19 Nov 2026
 18:46:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118051247.3885308-1-lcy8047@gmail.com> <96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com>
In-Reply-To: <96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 19 Nov 2026 21:46:38 -0500
X-Gm-Features: AclHuK_LbjhS7-Db8Zoq1dtarOebPOZsaYeLwUIwTxAs3oDtr1MYrA09Uyk3gnY
Message-ID: <CAKefsHu6P6FJAz6hV6+Fzm_PgXcTCn54WjD5pH0ThLC1A-DOFA@mail.gmail.com>
Subject: Re: [PATCH net] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a
 rule fails
To: Jianbo Liu <jianbol@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for the review. I will update the patch as you suggested
and send a v2.

Best,
Changyul
