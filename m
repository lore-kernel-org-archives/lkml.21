Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881859;
	b=2Ef37V00mMC7De8P2Nb0NmuAlSsUy7FaqTs1+AcwPhTk2Uu4eP4irTZOujWGFFDtfNZA
	 vsu5jgsv4hqK/A3gf1IbveqjZdpc8ZjvNGuDd3dvp3M8wxCc3DHvxpZupWwOfYCw2IOcB
	 hi70EeQaGQy04T0VDXhwtOr0w7GCXuFyqxAUE5ACzHuim0FOM/As7UGVtlj3z84SVrwGq
	 3aCs4mKbAKeedp0ktM7h707tT7iVe+OUNdKUIg8Iw2rXhTBGvq04sl9NcHiKDI+YuPMWh
	 +xgofdqpRaXp6yIQzSNNpbpeKbj22afdXqqnvdltJLCS8OsxNC7nvMDJNyXqNKhtVNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881859;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=y8vn2M+J9MfeAb/SPa6hqVf+fLcZOZfX9GS99IIIR60=;
	b=R6Cjct6zNMhtfrzoEHk+3x1dFSkqK6LQjIURv8wcFYRdNJj32Ka2xkkD3NsS+9mGuvyX
	 AqLbdyoSv+SY4L7UkjOdVFKKb3bHgXgZ25HAWbscC/U7po7+HRP88xH8PRIrHpuCNO3Ap
	 T6pJBM7uIuDOvOe7GF9tntLSY+BnV4+JIrv9AB9advqs6lbVvA4WAhjlL/VLi+es0AZ6q
	 Q99OvA4CIBetgfye2ZqF6h6prXbX5f/lpd1tQgVAK2TeB/XDr3ILg3QaUohr04CLwnYwL
	 cKdh6jDMMih/HXtNIe83I1JZqbhHEztFi0eN7zRwDzCawqgDvuF6vXEUpVW0owm6DLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OEa+WHUy;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B329606A323;
	Sat, 28 Nov 2026 16:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B329606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OEa+WHUy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y8vn2M+J9MfeAb/SPa6hqVf+fLcZOZfX9GS99IIIR60=; b=OEa+WHUyhAGed+6MCKiWXR9CSs
	WaTw7+pt1OQ8/GcQlK7gZKLsZx0PBD5IFVTVHQUHQeJ8Uauo6Zn25fAxt1/EcJLRMeheIkvqCYP+m
	7VhaYPYmv6OHNsb5drPz3JN0QR8DX8YqpO/lIBRpldJ1Uvq0JcEMKhL7NvLRJrHwk11c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xXKu6-0020I6-2z; Sat, 28 Nov 2026 17:03:58 +0100
Date: Sat, 28 Nov 2026 17:03:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v4] net: ibm: emac: attach and start the fixed-link
 PHY
Message-ID: <a7773c81-a42d-4989-a0e3-68851226424a@lunn.ch>
References: <20261127014748.2908781-1-xiaolinkui@126.com>
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
In-Reply-To: <20261127014748.2908781-1-xiaolinkui@126.com>

On Fri, Nov 27, 2026 at 09:47:48AM +0800, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> emac_init_phy() sets ndev->phydev by hand for a fixed link, so
> phy_attach_direct() never runs. The PHY is missing from the netdev's PHY
> link topology and ETHTOOL_MSG_PHY_GET dereferences the NULL link_topo in
> phy_prepare_data().

The size and complexity of this change is snowballing. Without having
hardware to test on, i'm wondering if it is better to just leave it
broken. I don't think any user has reported it, so it does not bother
anybody.

What really needs to happen is a complete rewrite, and that definitely
needs hardware.

      Andrew
