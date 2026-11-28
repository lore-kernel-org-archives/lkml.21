Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795887456;
	b=djdqj96iqbLdnjG80hxmaSwE92MJAaB5nPW27VII0NzzXxUY/ckYX4NIUhVDHp2CgByr
	 JCUpe/ReC3hF3AfJ7M4Rm+Sr7owEjszaU7Y05TxMzLv+KZBio9Ha4A9UJpujohY80hWFF
	 veMF+kvPtQa1+rR4K9Hgff80BgoMxR98gMfRZUkR2C/QG6LNYAecDhMXLX3uepk/vNVXr
	 zxx9fB4QUGkOKfcRL0mm1VhXBhvkH28feoCu/3WTrclIxYf4wTtVqZZ9h/5GdXXuGcXHH
	 moSvZjCMU/8XcvQyvElz9/lngyYSzb3tg7FjUxuWjUSs0I8n0k34RiMfXPz3OWIedyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887456;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=b2SvXRP/HyaLtE5GTf4mgqpBfNERWI+DPy54Q3r0I3s=;
	b=acbCtQ7s5fXoEv/5WLaPuJ8ynjxAzFHvojZRPMmhKB6eZ7VYVrjJZsOjgZ6EKDWnXil1
	 HT/VzCSc5WWs+RamdNsG0ljMGW2guA71pBrsc1Hj3jk7EaJj3fdzbRZKlt+TnWcFB2VNa
	 AaL3rkgb0XWA6cwakWOHG6zdaKfa1v4D1oLVjgFh8W+mh8FWxgE7l+z6MVbvrboOLnHq1
	 NN6+Xg7+An6iRB8KjGVyq8Vp856VlWBpz+dOShYaqC1ba7Ajx095f2/FxEsygkX+T9BbT
	 +ZElTFWLaEqDj+wWrudpXF83vR4rY2ZtLBc+WwuVrvTi6/sjsDsEoxExeoORTornBgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=schaufler-ca.com;
	spf=pass smtp.mailfrom=schaufler-ca.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=HCN3s7+i;
	arc=none smtp.remote-ip=66.163.188.153
Received: from sonic303-27.consmr.mail.ne1.yahoo.com (sonic303-27.consmr.mail.ne1.yahoo.com [66.163.188.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6C606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=HCN3s7+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795887454; bh=b2SvXRP/HyaLtE5GTf4mgqpBfNERWI+DPy54Q3r0I3s=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=HCN3s7+iIvpT15dVddxJ6vmzDJSH8VuijbCV86GnvKNy5Et1MElGK9YrfjdxBqB0wUVJKLggKKEzpfphvSS+uF+krLM3x48JAP1YB84OXDYFtL/lRuEGrCs/kouSn+1iYmIrsQ2GZkHH2rEp7l580KJGA0rXCfDJvqzdjJkWVGOtugEg+mePyDqEinkcOpeijOiLHQ4PcUgN5YH7IHxLiwJdts6MLHIQJ9l0YxJ3hjWETxapA87kTCVeH/AXUVzKAczpNjWXEJ2XUmPY8waUHsSlJ2zTUYMpYd+8f8as6WR5VrvwzKm2qj6lQoV24mbylxJWAyE/uKyAvJIwOdi4yw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795887454; bh=5efnk+wOwjKIC6tVyIWOXf9/QpKI2Y7KWwmRTTKIc8J=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=D75pcEdVCCxwMqmVbCL35Lhpil96MRYWY4o2gy6uiYgnoXTePZEBdRkPQwYTEYYJIk6hHCmFbm72M5RdyU0N0J5ffnZqVTyX/EFTZMgo9V2rdqmH/rY8psnRcbAAuMRkrPaRyzDEGWw/9Es33pkf7dFNldkceYK2laf1TXmCY/9k2u7bfIBJMz8Ka9XRomeJ2X7ScSV4U41UpUrrLsRVWWXvxAax0iPINqb9oPHDqwYsClQ9pVo1aIuVvXkRHvZANrFSAiwqF5YVzlv8laK/mEd4R2FZAKyTalAqmk7VusIyjGDzw6nEYFZwZF3bT7mILDRBdTaDs5PIzqMoWeqw+A==
X-YMail-OSG: QWNVLqIVM1kjokMZdp5HiLOjy6f7n_CGBFnDFhSfM_Ai.op5AQmfCv4DiYBILIJ
 fmxLSuVpCnLKx2qxjNAq7E1pdiuFayV522m6rL21REwyeT7noDqGhXarjAqDlWo88piLMCbJwnbP
 rLjtGPqd9gHAhdbrlHGzTW.tv.d3ViFpUaoDuD7xR4ulBJJVxI1XvRSTR9_iAfxyuR3HClxlolPi
 1bUWyYvj0Jwg_cqslrVLFxWq7hhnoBDMDCnSDJxOzhwHGKxCjTvb0kgWduuyTeUEfjZ70iW.Qeqm
 Zm3p57BHKH28cUKyR3xrWBaNjouMKwJUGwloUSx0BHnnADhxTj.jWqTyMBrIdM7dhK66w4CT1mg4
 vDlZU5zZ39KRHJCGyQdhwVjI5t5yIWdgYGSTMmnTpIyQGsxZ2UqR_MMG5rZkzfzFAu0LjPRYEMdm
 29eaB6cKOhqpcKLMa8ZnIKmCPg6UlGLqh3wp_nQNR99Y8zWF5FxYcCVo0tyh.Cov9et71fcIfv1I
 bKSd1XblTaRMLcJbuIPiGiK3Kd.Muib4HFvJRHOxL6s_HpPtvQbPESX0tC9r43jB1MCoXzzAOaAo
 9GWdPbenqZLHDT5qTiIrAJnQWixeH9j9TH2yayBQC8sYka._tmJ13vki_VbKFiMpA3LDl_F0.3lf
 4ywTo4tp4EKj5VkPIomgK09Zs_vt8DsML1MXtB.jrKm7ahk2Q78ac7detW4rXv770L7tGp5k71dW
 7DVQTwJsd6bjeZym3Ht0u3pqqbdPEb40z_lw5fplPGwPX6i5heL_wor5osTdu30zecmAzgMmAt3k
 GzN8ANqyiI6y4uYRRKkZ5aA205MQLPXR6DS_hcCYyDNl5OUWAvyZyLCSR7rlQa9GWh77agvk5_Lc
 9jJmGBtwJ.ypnVMSn64tsoQBMktW7TeOs2Mh1ilZmgfi4GwJuYV1RTy5QTjJgAmUMITFIeR08Cmy
 bgsyG5l.gy2UvpMU28hH0januKqxBRXhuJnFtAvtlfr8PRGsHTqVscmIYe0A3muL1FifF1UKSwWv
 NtQziESOiZNRQnjMHtgTt4aBA.3g0ZWlIMvn1wIJuHjCJgUWmTg0dt_KpVtgEwLMeJAVum6O9XBo
 JiloBK7Xhd_VSSzDLVaZyFWvMKUl.k_2VUCzMfcEJsbfauGr8r9ZGohebwPqbcSJ4jDfbr4lFGu.
 Ez3ukLF0rS1fyoOf1jEs.TuYrbVN1.V_ZJoQbebLrFK_zKKSko4KKID8e17woY0AogMvZWCt9Szw
 mPLs7GdqF_CFMTONQ9UFAUmTC13FrA8OJbAvzmH1s91ropCC1HWe2jDMZ9U.DIaLnGoheDzl1dCX
 72jBFZxzYSI0XcpmAQ5DAUcbbD8DOeZAGkT7NrrWc21AQ_qR_luN.FYCSOO26iDwqGpwMNZ0yT4N
 zyhNdJ7KWfONNzbH8OI5CGRqJBSiW3xo1NN3wqalXxEeogWRU3RL8z4ZFGTZH1jAJVOYzhN.o.rb
 I3eIIvOQXhWVG_U8Kg8z8AF5azQUO_lXDktDTb2t6MPv78Oc4ZaKvS_ry2tQluECGoqAf0XS3eGX
 lc6Onit0uJB5RywXMe8gXlamifqetoN4dh3_DO0a06I8hkf1qfn_uhOMO0b.7mSllBa5WP2BEnxq
 bATKLVFfPaqXT38Y3u3bubzhYOF9zqa_UM6mOvaUPs_nUatnqwHetNb1HOH4bDARK3jQULP8oXRs
 Qouww__XZCQCTmdRxc0_JNSCbLNARBxJTArvv28N4htaGde8GG0RiNpV8iXpxQ3Q6JGd_CWIytZE
 GFV23wlO93iSXEHE9bzH6l0CzWo6lkTajfxBOnCp67vKJeGjt0pAIqFd2XBu4koA5f2DP_eWoE8q
 e41n3UKpIhHJFIoV.sVcVuSUg.iK9PUk9jT7Zp1rTKRyvQuM9HbhYDhP9CrHbPeZP_tJrHWBYn.s
 FTuZh5utOhJXwN0VlzpaGOwtbxJpXER7iWbMgl9iaC1TJUakVnevxvpEiL46Sz8oCd6dDecLq_Mp
 9kbvHwpl5sW3rIWpBO9u6M8Wy.qdd7LEXVoRRol0yj92My7BEOoJWDiFyNw_FJfm2ulfgSnTCHOX
 z3yGIm682dvoVNSoM1byId4Z4w2VQXtr3RpwWmzxQI4wXGnbiEf5t8PJT5jb2JaiUQ.CJB4BYKlU
 KwvT3YQdGZW3BNBOZk0IQ3AnL8oNoOxZQP6zR8QdPoPW8.SXjwqfRe6wjdgBsNFtrOoxf_KuZHJ3
 D_ixP5_oYZ65gq6JEwbpWsaMCTineSDmyED96e0NQT3rbz.ifI8Hrnckt0j44g.qSod_2MJEYUIL
 6v83GzJbyOvmzcAC8Dhgbg1AGeg_W
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 96afbf62-d46a-43ed-aa50-2a6f2bb7d4ab
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 17:37:34 +0000
Received: by hermes--production-gq1-7c58b65db6-rd56z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b065bd60311b2abbe862eeb713695335;
          Sat, 28 Nov 2026 17:37:32 +0000 (UTC)
Message-ID: <9cd7e2c5-22a0-45fc-ad41-56bac8bcbbeb@schaufler-ca.com>
Date: Sat, 28 Nov 2026 09:37:30 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smack: mediate file attribute syscalls
To: shaos <shawnq1@163.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
References: <20261128082823.3074924-1-shawnq1@163.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20261128082823.3074924-1-shawnq1@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/28/2026 12:28 AM, shaos wrote:
> Hello,
>
> Smack does not implement the inode_file_getattr and inode_file_setattr
> hooks.  As a result, the file_getattr() and file_setattr() system calls
> bypass Smack's existing read and write checks.
>
> The reproducer runs as uid 1000 without capabilities and changes its
> Smack label to Subject.  A stat() on /mnt/secret is denied, but
> file_getattr() on the same file succeeds.  The Subject label has only
> read access to the Control label, yet file_setattr() clears the file
> flags on /mnt/control.  Ordinary open() checks continue to be enforced.
>
> This bypass exposes file attribute metadata and permits changes to file
> attributes that the Smack policy denies.  It does not expose file contents
> or demonstrate privilege escalation.
>
> Tested source revision:
> HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
> source version: Linux 7.4.0-rc4
> compiler:       gcc (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0,
>                 GNU ld 2.38
>
> console output:
> https://gist.githubusercontent.com/shaos26/fbf8b7f663ee82593d7d41623aa2e2c4/raw/2ad22ab46d2cf376b59ef361d9c7ca2b691c6eda/console-output.txt
> kernel config:
> https://gist.githubusercontent.com/shaos26/fbf8b7f663ee82593d7d41623aa2e2c4/raw/f9e1ceca2f52ead87738af313610fc49834654dc/kernel-config.txt
> reproducer:
> https://gist.githubusercontent.com/shaos26/fbf8b7f663ee82593d7d41623aa2e2c4/raw/d9b447aad65076391390d150d752b6b9cb116abc/poc.c
>
> Build the kernel at the tested revision with the attached configuration.
> The reproducer is a static init program and expects an ext4 image on
> /dev/vda containing empty files named secret, control, and public:
>
>     truncate -s 32M smack.img
>     mkfs.ext4 -F smack.img
>     mkdir mnt
>     mount -o loop smack.img mnt
>     touch mnt/secret mnt/control mnt/public
>     umount mnt
>     gcc -O2 -Wall -Wextra -static -o poc poc.c
>     mkdir -p rootfs
>     cp poc rootfs/init
>     chmod 0755 rootfs/init
>     (cd rootfs && find . -print0 | cpio --null -o -H newc) |
>         gzip -9 > initramfs.cpio.gz
>
> Boot the initramfs and ext4 image with:
>
>     qemu-system-x86_64 -m 2G -smp 2 \
>         -kernel <linux-tree>/arch/x86/boot/bzImage \
>         -initrd initramfs.cpio.gz \
>         -drive file=smack.img,format=raw,if=virtio \
>         -append 'console=ttyS0 rdinit=/init lsm=smack loglevel=7' \
>         -nographic -monitor none -no-reboot
>
> On two vulnerable boots, file_getattr() on /mnt/secret returned success
> while stat() returned -EACCES.  file_setattr() on /mnt/control also
> returned success and cleared its flags.  With this patch, both denied
> operations return -EACCES; permitted operations on /mnt/public still
> succeed.
>
> Implement both hooks with the same Smack access checks used by the
> existing getattr and setattr hooks:
>
> Fixes: defdd02d783c ("lsm: introduce new hooks for setting/getting inode fsxattr")
> Signed-off-by: shaos <shawnq1@163.com>
> ---
>  security/smack/smack_lsm.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 3a4a33568297b..6da2492f9bb61 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -1311,6 +1311,34 @@ static int smack_inode_getattr(const struct path *path)
>  	return rc;
>  }
>  

Please include a kernel-doc comment on each of these functions.

> +static int smack_inode_file_getattr(struct dentry *dentry,
> +				    struct file_kattr *fa)
> +{
> +	struct smk_audit_info ad;
> +	struct inode *inode = d_backing_inode(dentry);
> +	int rc;
> +
> +	smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_DENTRY);
> +	smk_ad_setfield_u_fs_path_dentry(&ad, dentry);
> +	rc = smk_curacc(smk_of_inode(inode), MAY_READ, &ad);
> +	rc = smk_bu_inode(inode, MAY_READ, rc);
> +	return rc;
> +}
> +
> +static int smack_inode_file_setattr(struct dentry *dentry,
> +				    struct file_kattr *fa)
> +{
> +	struct smk_audit_info ad;
> +	struct inode *inode = d_backing_inode(dentry);
> +	int rc;
> +
> +	smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_DENTRY);
> +	smk_ad_setfield_u_fs_path_dentry(&ad, dentry);
> +	rc = smk_curacc(smk_of_inode(inode), MAY_WRITE, &ad);
> +	rc = smk_bu_inode(inode, MAY_WRITE, rc);
> +	return rc;
> +}
> +
>  /**
>   * smack_inode_xattr_skipcap - Skip the xattr capability checks?
>   * @name: name of the xattr
> @@ -5185,6 +5213,8 @@ static struct security_hook_list smack_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(inode_permission, smack_inode_permission),
>  	LSM_HOOK_INIT(inode_setattr, smack_inode_setattr),
>  	LSM_HOOK_INIT(inode_getattr, smack_inode_getattr),
> +	LSM_HOOK_INIT(inode_file_getattr, smack_inode_file_getattr),
> +	LSM_HOOK_INIT(inode_file_setattr, smack_inode_file_setattr),
>  	LSM_HOOK_INIT(inode_xattr_skipcap, smack_inode_xattr_skipcap),
>  	LSM_HOOK_INIT(inode_setxattr, smack_inode_setxattr),
>  	LSM_HOOK_INIT(inode_post_setxattr, smack_inode_post_setxattr),
