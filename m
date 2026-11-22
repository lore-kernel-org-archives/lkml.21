Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795364662;
	b=Q1+HUbgl1jHDN2zNk0Ips6k9Z8QH7a1xZCkvw/WgSVPpjRGH21jsTcr8Ri25ZQToEb9J
	 y3SaxmtmUuv1o3bm7wQz2NuIwun17v8ovionubL6OwbzXit1zX+yRrJuga/qPUMNFThYQ
	 owPbk30X7QDc62w80ANcPTltRAq7Ek2qmY3QMF6IQ7Zy9m0fNZUgQx3zSCb/iecD5VFf0
	 9ogdT8/pQWICGnsJm6TL8pIKiqElWNwlXspxSs488jiuvIZ0UAXt7GRy25BI9C39JF0TJ
	 stLePioC0Gctu6j8aaWMajfdrI3KckqHhKPQ1Xw0Yz5sI0Y1H0uxeLRrGdtIFCv7LTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
	b=qvW77lvP8d/CWp4NIqtZcG/6rCnUFyVk74UqCq6RAKAGDdOEyBp5pq1RS/EumbV/0kpZ
	 e98YW3hppnpuAfOocS884ZJV2mJgmb6+yVSmLYIqSv8ayZXMQHs/t8vF+wNUGYC2/OhOS
	 jZS+ymKFygGDZRCXIdKnOZHYwO3jyE5SP81dr4STmeKJ2TLH+uRGdFp6pt49C2HxIkHkf
	 vCq3RPlr/zUWSmB7aLiDTNUP1/bzFLK5UYXGWGVkKgDPO5+rzHpEfC+dwIcmKqShuOcoE
	 tnq6EsphHuIkXOTuwY1iByiPQVa7U1WChz8fATBYvA4vTMADk+8CxOSdYZPAijVKMBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afX3YfcW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D8606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688D8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afX3YfcW
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso934545e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795364660; cv=none;
        d=google.com; s=arc-20260327;
        b=W7n6Gaopsw5U9kzmmsPC4C4ZnJsNab6jOg+surbKv6Bx1xw1Hzx9NY9AGX9dqKEjfG
         XFOCbuGXbxmyNlKVhKxIcp11mXrJYwyfD31xMOwZP9GV/lxorLKJMybcFeeJGvZcdFt/
         ZfRfFVp5XP/TjaDEsqdAGUk4YNe3Xpkvr5m6GREpfu8dOe5QGAAfu8eUm0JMBsYnqI3o
         ckqKuS3gW2EzTPQ8Rke+o2unzKjHQPvsatsfMo6iDO2JUVrHI39A1k499mfwoaqAR6uK
         nsJB1tCKVLhCx0tx33uDBgG1KcX8NseK+vbIBm3HQKPfEzZa+9/GnQVI0xJcsDigvUAV
         i9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        fh=Q5biofffSgh9TINedp+g7TqD/I0PygMYJlvKjObSlts=;
        b=c4QR1RTjyY914/gdVRvFVBtr78KZNYfLiOMSMg92QVDD2494V0wxUHABxIctcrGoak
         vcDkUOQNT1AxMVPsEkw4o8KFm20e3fP2Ju974K8N2LiyFgPc16ASFTTgI28jEHaqwvle
         uZpInn5dwBVSiXTRwlMHKnau+hADKUZIob+JOni+OM759w0S32q/3HNl66l7pH+pS7eX
         flkkw/5SBX9hKIWQNGw5EavVgTEMvJLhtmggAwjqo1CnZLX9W/HTHUAU0wz/mctI2UdR
         JKSYe7q+XAv4k9n63ZftdvjN7gtV4NEMiiBPSJBxNEe/cbJx67ZI3bkesSz1PY6FpQTK
         5KWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795364660; x=1795969460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        b=afX3YfcW9NAzIVyC17QRC5kSiBGMdB/4Q4CF6WclhBWSrQ7USro/hLjvmTBwqJ8X9A
         wBnkU23S0DP0LEmfDyXe/p2K8oc+v/dL7oH63JVMm2TD5mGHkyuMQ+9CBG4HSsvQcCD6
         t9cd+KtsJD3zpbmFE+MLhXIFqkHOGYVCuKKNBjOl6mhG8BBdY0r7UyU9elfO+a6zskxW
         IAUrJliC/Nxh05CJ2iettyCY0+urMoxTIThz8fpDGCcc/RpVyYYuy3tj6prE4lcyhrtC
         fXm9VNtpGBxIxxTerTC7onuMSQgqid7onNV6aDvNSocDYIZIwlNfA7L1UhZpW8U6Bt4m
         nQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364660; x=1795969460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        b=grTzmdA8SziQcN3WMFJDmJF2DYEpyEkMbmNcyHj+evd3ifxs4vGZsXXTieGXIE5QjS
         n4y+rc7OIJviyAp4ZII5dP6jDL+rhH5TQv2K84gx63qAzKOtZPcKgus/rb1OFxKBoATU
         YGEEd9oubzlO7Rzduaw5DG/0q4jMtD/5dBO4cum5THT+YQHUb27U7sP8ZxSl/d/T5D4w
         pbT1GTnJZ+vdRfPKRoHMn+hx0WtWKDwAGOpABgQhMa3BcE/WbRbKAnoC2acfCt4P4IaU
         Osbrr+tHETC7NuF+FaISlB1rEAaDnD10pFlHxgpKE7LnTnPU3B1XHz4hXJCyH8lOEX10
         HxMw==
X-Forwarded-Encrypted: i=1; AL+hErGj+ckWo2ek2g6ZBldQ/RpwEQetztPP4HUpweByiH7isewjXOgP0obp1wfj+k21lXuFnseMHuGBOW6oFYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mF1bPWbIX6G+TvLovcM8gjB9WX/zGxLp7qc8vAm7kndu+cSs2
	DQeebkRD2I19ORMCwBSIP8m0A9ye6jLAWgSMO/Jb7ABGPNdnL9tTILVJIMUKClk13y2K0oeNFGj
	/LOkmiXN92/H9PnCY5x/r1Gi+k4tBELE=
X-Gm-Gg: AZFdTZe3KWtAFZrbhlPs8cY07MPw5fVfmuEkZ60y9Zdtr7xdN7PaCH9dy5NDgPYWjXk
	GhXUM5JOcMte+uvND/K+YQ/DqyQZgnW3GDCezk94q4Aji914+6PGisrXN0BxbDDglaDXogh5koj
	fbjnAIzAblm2nwC8QBG+I49hL7uAv9/rErgt8MkO2wroJb/u+2VRccWYqzn9mwFTo8djaRjcjee
	uWARj13ujqpI9iT5m3qrpeCwpCfdXSBGpeqUVdItPnp4l7Ml1z+rr6DG7PVif7xrjvhED6yzEpt
	do2kfrodDbxsfn8F9IJJ/w9aijtN5DXMAugy4PcNOYqNjdIicoqBg/AiUj3EqVp6sgi0rDrwU+o
	GcniTc5P+9MDTARy/0EvPWzQ/T9XKTeC+iknizhChWfmUiqAWgRUBbYfuaGMJN206
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id
 71dfb90a1353d-5ee8af5d5c6mr4139590e0c.19.1795364660204; Sun, 22 Nov 2026
 08:24:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122045841.99012-1-fredric.cover.lkernel@gmail.com> <202611221905.fQpuvetd-lkp@intel.com>
In-Reply-To: <202611221905.fQpuvetd-lkp@intel.com>
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
Date: Sun, 22 Nov 2026 08:24:49 -0800
X-Gm-Features: Aa3M54pLCK7XgGyFOtsNWn7B-0IlzQDmNjwu1YO12B2eu424c3ONrYetGFn3o_M
Message-ID: <CAAk_H6H8SZaa6xsKmyViYMwCe+-Z2xaftVjT0zrW_B-PJjvumw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: convert DFS target node name from cache
 charset on mount
To: kernel test robot <lkp@intel.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Tom Talpey <tom@talpey.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paulo and list,
Please ignore these build errors. They are due to the dependency on my othe=
r
patch. If you would like, I can put them both in a series to avoid
errors like this.

Thanks,
Fredric

On Sun, Nov 22, 2026 at 3:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Fredric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on manguebit/cifs-next]
> [also build test ERROR on manguebit/cifs-fixes linus/master v7.4-rc3 next=
-20261120]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Fredric-Cover/smb-=
client-convert-DFS-target-node-name-from-cache-charset-on-mount/20261122-04=
5840
> base:   https://git.manguebit.org/linux.git cifs-next
> patch link:    https://lore.kernel.org/r/20261122045841.99012-1-fredric.c=
over.lkernel%40gmail.com
> patch subject: [PATCH] smb: client: convert DFS target node name from cac=
he charset on mount
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261122=
/202611221905.fQpuvetd-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261122/202611221905.fQpuvetd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611221905.fQpuvetd-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/smb/client/dfs.c: In function 'dfs_parse_target_referral':
> >> fs/smb/client/dfs.c:44:21: error: implicit declaration of function 'df=
s_cache_local_path'; did you mean 'dfs_cache_canonical_path'? [-Wimplicit-f=
unction-declaration]
>       44 |         node_name =3D dfs_cache_local_path(ref->node_name, ctx=
->local_nls);
>          |                     ^~~~~~~~~~~~~~~~~~~~
>          |                     dfs_cache_canonical_path
> >> fs/smb/client/dfs.c:44:19: error: assignment to 'char *' from 'int' ma=
kes pointer from integer without a cast [-Wint-conversion]
>       44 |         node_name =3D dfs_cache_local_path(ref->node_name, ctx=
->local_nls);
>          |                   ^
>
>
> vim +44 fs/smb/client/dfs.c
>
>     13
>     14  /**
>     15   * dfs_parse_target_referral - set fs context for dfs target refe=
rral
>     16   *
>     17   * @full_path: full path in UNC format.
>     18   * @ref: dfs referral pointer.
>     19   * @ctx: smb3 fs context pointer.
>     20   *
>     21   * Return zero if dfs referral was parsed correctly, otherwise no=
n-zero.
>     22   */
>     23  int dfs_parse_target_referral(const char *full_path, const struct=
 dfs_info3_param *ref,
>     24                                struct smb3_fs_context *ctx)
>     25  {
>     26          int rc;
>     27          const char *prepath =3D NULL;
>     28          char *node_name =3D NULL;
>     29          char *path;
>     30
>     31          if (!full_path || !*full_path || !ref || !ctx)
>     32                  return -EINVAL;
>     33
>     34          if (WARN_ON_ONCE(!ref->node_name || ref->path_consumed < =
0))
>     35                  return -EINVAL;
>     36
>     37          if ((size_t)ref->path_consumed < strlen(full_path)) {
>     38                  prepath =3D full_path + ref->path_consumed;
>     39                  /* skip initial delimiter */
>     40                  if (*prepath =3D=3D '/' || *prepath =3D=3D '\\')
>     41                          prepath++;
>     42          }
>     43
>   > 44          node_name =3D dfs_cache_local_path(ref->node_name, ctx->l=
ocal_nls);
>     45          if (IS_ERR(node_name))
>     46                  return PTR_ERR(node_name);
>     47
>     48          path =3D cifs_build_devname(node_name, prepath);
>     49          kfree(node_name);
>     50          if (IS_ERR(path))
>     51                  return PTR_ERR(path);
>     52
>     53          rc =3D smb3_parse_devname(path, ctx);
>     54          if (rc)
>     55                  goto out;
>     56
>     57          rc =3D dns_resolve_unc(DFS_DOM(ctx), path,
>     58                               (struct sockaddr *)&ctx->dstaddr);
>     59  out:
>     60          kfree(path);
>     61          return rc;
>     62  }
>     63
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
